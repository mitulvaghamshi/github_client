import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_client/utils/client_config.dart';
import 'package:github_client/widgets/login_page_builder.dart';
import 'package:github_client/widgets/tab_page_builder.dart';

void main() => runApp(const App());

@immutable
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const CupertinoApp(
    debugShowCheckedModeBanner: false,
    title: 'GitHub Client',
    home: GitHubApp(config: ClientConfig.fromEnv()),
  );
}

@immutable
class GitHubApp extends StatelessWidget {
  const GitHubApp({super.key, required this.config});

  final ClientConfig config;

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
