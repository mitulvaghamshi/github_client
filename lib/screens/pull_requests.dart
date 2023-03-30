import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_app/src/github_gql/github_gql.dart';
import 'package:github_app/utils/query_exception.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:url_launcher/link.dart';

typedef _PullReq = GPullRequestsData_viewer_pullRequests_edges_node;

class PullRequestsList extends StatelessWidget {
  const PullRequestsList({super.key, required this.link});

  final HttpLink link;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<_PullReq>>(
      future: _getPullRequests(link),
      builder: (_, AsyncSnapshot<Iterable<_PullReq>> snapshot) {
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
            var pullReq = snapshot.data!.elementAt(index);
            return Link(
              uri: Uri.tryParse(pullReq.url.value),
              builder: (_, followLink) => CupertinoListTile(
                onTap: followLink,
                title: Text(pullReq.title),
                padding: const EdgeInsets.all(10),
                subtitle: Text(
                  '${pullReq.repository.nameWithOwner} '
                  'PR #${pullReq.number} '
                  'opened by ${pullReq.author!.login} '
                  '(${pullReq.state.name.toLowerCase()})',
                ),
              ),
            );
          },
        );
      },
    );
  }
}

extension on PullRequestsList {
  Future<Iterable<_PullReq>> _getPullRequests(HttpLink link) async {
    // Get first 30 pull requests
    var gRequest = GPullRequests((builder) => builder..vars.count = 30);
    var request = Request(
        operation: gRequest.operation, variables: gRequest.vars.toJson());
    var result = await link.request(request).first;
    var errors = result.errors;
    if (errors != null && errors.isNotEmpty) throw QueryException(errors);
    return GPullRequestsData.fromJson(result.data!)!
        .viewer
        .pullRequests
        .edges!
        .map((edge) => edge.node)
        .whereType<_PullReq>();
  }
}
