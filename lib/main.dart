import 'package:flutter/cupertino.dart';
import 'package:github_app/app.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: GithubApp(),
      title: 'GitHub GraphQL API Client',
    );
  }
}
