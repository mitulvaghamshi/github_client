import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_app/src/github_gql/github_gql.dart';
import 'package:github_app/utils/query_exception.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:url_launcher/link.dart';

typedef _Repos = GRepositoriesData_viewer_repositories_nodes;

class RepositoryList extends StatelessWidget {
  const RepositoryList({super.key, required this.link});

  final HttpLink link;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<_Repos>>(
      future: _getRepositories(link),
      builder: (_, AsyncSnapshot<Iterable<_Repos>> snapshot) {
        if (snapshot.hasError && kDebugMode) {
          return Text(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(child: Text('Loading...'));
        }
        return ListView.builder(
          itemExtent: 60,
          itemCount: snapshot.data!.length,
          itemBuilder: (_, int index) {
            var repo = snapshot.data!.elementAt(index);
            return Link(
              uri: Uri.tryParse(repo.url.value),
              builder: (_, followLink) => CupertinoListTile(
                onTap: followLink,
                title: Text(repo.name),
                padding: const EdgeInsets.all(10),
                leading: Image.network(repo.owner.avatarUrl.value),
                subtitle: Text(repo.description ?? 'No description...'),
              ),
            );
          },
        );
      },
    );
  }
}

extension on RepositoryList {
  Future<Iterable<_Repos>> _getRepositories(HttpLink link) async {
    // Get first 30 repositories
    var gRequaest = GRepositories((builder) => builder..vars.count = 30);
    var request = Request(
        operation: gRequaest.operation, variables: gRequaest.vars.toJson());
    var result = await link.request(request).first;
    var errors = result.errors;
    if (errors != null && errors.isNotEmpty) throw QueryException(errors);
    return GRepositoriesData.fromJson(result.data!)!.viewer.repositories.nodes!;
  }
}
