import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_app/src/github_gql/github_gql.dart';
import 'package:github_app/utils/query_exception.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:url_launcher/link.dart';

typedef _Issues = GAssignedIssuesData_search_edges_node__asIssue;

class AssignedIssuesList extends StatelessWidget {
  const AssignedIssuesList({super.key, required this.link});

  final HttpLink link;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<_Issues>>(
      future: _getAssignedIssues(link),
      builder: (_, AsyncSnapshot<Iterable<_Issues>> snapshot) {
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
            var issue = snapshot.data!.elementAt(index);
            return Link(
              uri: Uri.tryParse(issue.url.value),
              builder: (_, followLink) => CupertinoListTile(
                onTap: followLink,
                title: Text(issue.title),
                padding: const EdgeInsets.all(10),
                subtitle: Text(
                  '${issue.repository.nameWithOwner} '
                  'Issue #${issue.number} '
                  'opened by ${issue.author!.login}',
                ),
              ),
            );
          },
        );
      },
    );
  }
}

extension on AssignedIssuesList {
  Future<Iterable<_Issues>> _getAssignedIssues(HttpLink link) async {
    var gRequest1 = GViewerDetail((builder) => builder);
    var request1 = Request(
        operation: gRequest1.operation, variables: gRequest1.vars.toJson());
    var response1 = await link.request(request1).first;
    var errors1 = response1.errors;
    if (errors1 != null && errors1.isNotEmpty) throw QueryException(errors1);
    var viewer = GViewerDetailData.fromJson(response1.data!)!.viewer;
    var gRequest = GAssignedIssues((builder) => builder
      ..vars.count = 30
      ..vars.query = 'is:open assignee:${viewer.login} archived:false');
    var request = Request(
        operation: gRequest.operation, variables: gRequest.vars.toJson());
    var response = await link.request(request).first;
    var errors = response.errors;
    if (errors != null && errors.isNotEmpty) throw QueryException(errors);
    return GAssignedIssuesData.fromJson(response.data!)!
        .search
        .edges!
        .map((edge) => edge.node)
        .whereType<_Issues>();
  }
}
