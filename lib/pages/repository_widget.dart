import 'package:flutter/cupertino.dart';
import 'package:github_client/utils/utils.dart';
import 'package:github_client/widgets/future_list_builder.dart';
import 'package:url_launcher/link.dart';

@immutable
class const RepositoryWidget({required final AsyncList<Repo> future, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The icon (avatar) will be same for all repos for this user.
    // We'll cache the icon image from first repo and reuse it.
    // Not tested on forked repos.
    Image? cachedIcon;

    return FutureListBuilder(
      future: future,
      builder: (context, item) => Link(
        uri: .tryParse(item.url.value),
        builder: (context, followLink) => CupertinoListTile(
          onTap: followLink,
          padding: const .all(10),
          leading: cachedIcon ??= .network(item.owner.avatarUrl.value),
          title: Text(item.name),
          subtitle: Text(item.description ?? 'No description...'),
        ),
      ),
    );
  }
}
