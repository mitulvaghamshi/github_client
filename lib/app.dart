import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_app/screens/assigned_issues.dart';
import 'package:github_app/screens/pull_requests.dart';
import 'package:github_app/screens/repositories.dart';
import 'package:github_app/src/github_gql/github_gql.dart';
import 'package:github_app/utils/github_config.dart';
import 'package:github_app/utils/query_exception.dart';
import 'package:github_app/widgets/login_widget.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:window_to_front/window_to_front.dart';

typedef _Viewer = GViewerDetailData_viewer;

class GithubApp extends StatefulWidget {
  const GithubApp({super.key});

  @override
  State<GithubApp> createState() => GithubAppState();
}

class GithubAppState extends State<GithubApp> {
  @override
  Widget build(BuildContext context) {
    return LoginWidget(
      config: GitHubConfig(
        clientId: const String.fromEnvironment('id'),
        clientSecret: const String.fromEnvironment('sec'),
        scopes: const ['repo', 'read:org'],
      ),
      builder: (_, link) => FutureBuilder<_Viewer>(
        future: _getViewer(link),
        builder: (_, AsyncSnapshot<_Viewer> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError && kDebugMode) {
            return Text(snapshot.error.toString());
          }
          return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: const [
              BottomNavigationBarItem(
                label: 'Repositories',
                icon: Icon(Octicons.repo),
              ),
              BottomNavigationBarItem(
                label: 'Pull Requests',
                icon: Icon(Octicons.issue_opened),
              ),
              BottomNavigationBarItem(
                label: 'Assigned Issues',
                icon: Icon(Octicons.git_pull_request),
              ),
            ]),
            tabBuilder: (_, int index) => CupertinoTabView(builder: (_) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(snapshot.data!.login),
                ),
                child: SafeArea(top: true, child: _getPage(index, link)),
              );
            }),
          );
        },
      ),
    );
  }
}

extension on GithubAppState {
  Widget _getPage(value, link) {
    switch (value) {
      case 1:
        return AssignedIssuesList(link: link);
      case 2:
        return PullRequestsList(link: link);
      case 0:
      default:
        return RepositoryList(link: link);
    }
  }

  Future<_Viewer> _getViewer(HttpLink link) async {
    await WindowToFront.activate();
    var gRequest = GViewerDetail((builder) => builder);
    var request = Request(
        operation: gRequest.operation, variables: gRequest.vars.toJson());
    var response = await link.request(request).first;
    var errors = response.errors;
    if (errors != null && errors.isNotEmpty) throw QueryException(errors);
    return GViewerDetailData.fromJson(response.data!)!.viewer;
  }
}
