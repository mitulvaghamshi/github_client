import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_client/utils/client_config.dart';
import 'package:github_client/widgets/login_page_builder.dart';
import 'package:github_client/widgets/tab_page_builder.dart';

void main() => runApp(const App());

@immutable
class const App({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoApp(
    debugShowCheckedModeBanner: false,
    title: 'GitHub Client',
    home: GitHubApp(config: .fromEnv()),
  );
}

@immutable
class const GitHubApp({required final ClientConfig config, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LoginPageBuilder(
    config: config,
    builder: (context, onLogout, handler) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          .new(label: 'Repositories', icon: Icon(Octicons.repo)),
          .new(label: 'Pull Requests', icon: Icon(Octicons.issue_opened)),
          .new(label: 'Assigned Issues', icon: Icon(Octicons.git_pull_request)),
        ],
      ),
      tabBuilder: (context, index) => TabPageBuilder(
        seletedIndex: index,
        onLogout: onLogout,
        handler: handler,
      ),
    ),
  );
}
