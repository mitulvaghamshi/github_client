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
class GithubApp extends StatelessWidget {
  const GithubApp({super.key, required this.config});

  final ClientConfig config;

  @override
  Widget build(BuildContext context) {
    return LoginPageBuilder(
      config: config,
      builder: (context, handler) => FutureBuilder<Viewer>(
        future: handler.getViewer(),
        builder: (context, snapshot) {
          if (snapshot.hasError && kDebugMode) {
            return Text(snapshot.error.toString());
          } else if (!snapshot.hasData) {
            return const Center(child: CupertinoActivityIndicator());
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
            tabBuilder: (context, index) => _TabPageView(
              user: snapshot.requireData,
              handler: handler,
              seletedIndex: index,
            ),
          );
        },
      ),
    );
  }
}

@immutable
class _TabPageView extends StatelessWidget {
  const _TabPageView({
    required this.user,
    required this.handler,
    required this.seletedIndex,
  });

  final Viewer user;
  final RequestHandler handler;
  final int seletedIndex;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(user.login),
          // trailing: Link(
          //   uri: Uri.https('github.com', 'logout'),
          //   builder: (context, followLink) => TextButton(
          //     onPressed: followLink,
          //     child: const Text('Sign out'),
          //   ),
          // ),
        ),
        child: SafeArea(
          top: true,
          child: switch (seletedIndex) {
            0 => RepositoryWidget(handler: handler),
            1 => PullRequestWidget(handler: handler),
            2 => AssignedIssueWidget(handler: handler),
            _ => throw 'Invalid tab index: $seletedIndex',
          },
        ),
      ),
    );
  }
}
