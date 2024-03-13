import 'package:flutter/cupertino.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:github_client/widgets/future_page_builder.dart';
import 'package:url_launcher/link.dart';

@immutable
class PullRequestWidget extends StatelessWidget {
  const PullRequestWidget({super.key, required this.handler});

  final RequestHandler handler;

  @override
  Widget build(BuildContext context) {
    return FuturePageBuilder<PullReq>(
      future: handler.pullRequests,
      builder: (context, item) => Link(
        uri: Uri.tryParse(item.url.value),
        builder: (context, followLink) => CupertinoListTile(
          onTap: followLink,
          title: Text(item.title),
          padding: const EdgeInsets.all(10),
          subtitle: Text(
            '${item.repository.nameWithOwner} '
            'PR #${item.number} '
            'opened by ${item.author!.login} '
            '(${item.state.name.toLowerCase()})',
          ),
        ),
      ),
    );
  }
}
