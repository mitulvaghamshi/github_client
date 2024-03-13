import 'package:flutter/cupertino.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:github_client/widgets/future_page_builder.dart';
import 'package:url_launcher/link.dart';

@immutable
class RepositoryWidget extends StatelessWidget {
  const RepositoryWidget({super.key, required this.handler});

  final RequestHandler handler;

  @override
  Widget build(BuildContext context) {
    Image? icon;
    return FuturePageBuilder<Repo>(
      future: handler.repositories,
      builder: (context, item) => Link(
        uri: Uri.tryParse(item.url.value),
        target: LinkTarget.blank,
        builder: (context, followLink) => CupertinoListTile(
          onTap: followLink,
          title: Text(item.name),
          padding: const EdgeInsets.all(10),
          subtitle: Text(item.description ?? 'No description...'),
          leading: icon ??= Image.network(item.owner.avatarUrl.value),
        ),
      ),
    );
  }
}
