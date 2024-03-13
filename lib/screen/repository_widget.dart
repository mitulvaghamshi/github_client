import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:github_client/widgets/future_list_builder.dart';
import 'package:url_launcher/link.dart';

@immutable
class RepositoryWidget extends StatelessWidget {
  const RepositoryWidget({super.key, required this.future});

  final AsyncValueGetter<Iterable<Repo>> future;

  @override
  Widget build(BuildContext context) {
    Image? icon;
    return FutureListBuilder<Repo>(
      future: future,
      builder: (context, item) => Link(
        uri: .tryParse(item.url.value),
        builder: (context, followLink) => CupertinoListTile(
          onTap: followLink,
          title: Text(item.name),
          padding: const .all(10),
          subtitle: Text(item.description ?? 'No description...'),
          leading: icon ??= Image.network(item.owner.avatarUrl.value),
        ),
      ),
    );
  }
}
