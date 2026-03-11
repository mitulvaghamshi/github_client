import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_client/pages/assigned_issue_widget.dart';
import 'package:github_client/pages/pull_request_widget.dart';
import 'package:github_client/pages/repository_widget.dart';
import 'package:github_client/utils/request_handler.dart';

@immutable
class TabPageBuilder extends StatelessWidget {
  const TabPageBuilder({
    super.key,
    required this.seletedIndex,
    required this.onLogout,
    required this.handler,
  });

  final int seletedIndex;
  final AsyncCallback onLogout;
  final RequestHandler handler;

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: handler.getViewer(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (snapshot.hasError && kDebugMode) {
        return ErrorWidget(snapshot.error!);
      }
      return CupertinoTabView(
        builder: (context) => CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(snapshot.requireData.login),
            trailing: CupertinoButton(
              onPressed: onLogout,
              sizeStyle: .small,
              child: const Text(
                'Logout',
                style: .new(color: CupertinoColors.destructiveRed),
              ),
            ),
          ),
          child: SafeArea(
            child: switch (seletedIndex) {
              0 => RepositoryWidget(future: handler.repositories),
              1 => PullRequestWidget(future: handler.pullRequests),
              2 => AssignedIssueWidget(future: handler.assignedIssues),
              _ => throw RangeError.checkValidIndex(seletedIndex, [0, 1, 2]),
            },
          ),
        ),
      );
    },
  );
}
