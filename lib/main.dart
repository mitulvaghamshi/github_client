import 'package:flutter/cupertino.dart';
import 'package:github_client/app.dart';
import 'package:github_client/utils/client_config.dart';

void main() => runApp(const MainApp());

@immutable
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub API Client',
      home: GithubApp(config: ClientConfig.defaultConfig),
    );
  }
}
