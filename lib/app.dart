import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_client/screen/assigned_issue_widget.dart';
import 'package:github_client/screen/pull_request_widget.dart';
import 'package:github_client/screen/repository_widget.dart';
import 'package:github_client/utils/client_config.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:github_client/widgets/login_page_builder.dart';

@immutable
final class GithubApp extends StatelessWidget {
  const GithubApp({super.key, required this.config});

  final ClientConfig config;

  @override
  Widget build(BuildContext context) {
    return LoginPageBuilder(
      config: config,
      builder: (_, handler) => FutureBuilder<Viewer>(
        future: handler.getViewer(),
        builder: (_, snapshot) {
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
            tabBuilder: (_, index) => CupertinoTabView(builder: (_) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(snapshot.data!.login),
                ),
                child: SafeArea(
                  top: true,
                  child: switch (index) {
                    0 => RepositoryWidget(handler: handler),
                    1 => PullRequestWidget(handler: handler),
                    2 => AssignedIssueWidget(handler: handler),
                    _ => throw 'Invalid tab index: $index',
                  },
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
