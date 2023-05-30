import 'package:flutter/cupertino.dart';
import 'package:github_client/app.dart';
import 'package:github_client/utils/client_config.dart';

void main() => runApp(const MainApp());

@immutable
final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = ClientConfig(
      limit: 20,
      scopes: const ['repo', 'read:org'],
      clientId: const String.fromEnvironment('CLIENT_ID'),
      clientSecret: const String.fromEnvironment('CLIENT_SECRET'),
    );
    return CupertinoApp(
      title: 'GitHub GraphQL API Client',
      home: GithubApp(config: config),
    );
  }
}
