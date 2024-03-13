import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:github_client/widgets/future_list_builder.dart';
import 'package:url_launcher/link.dart';

@immutable
class PullRequestWidget extends StatelessWidget {
  const PullRequestWidget({super.key, required this.future});

  final AsyncValueGetter<Iterable<PullReq>> future;

  @override
  Widget build(BuildContext context) {
    return FutureListBuilder<PullReq>(
      future: future,
      builder: (context, item) => Link(
        uri: .tryParse(item.url.value),
        builder: (context, followLink) => CupertinoListTile(
          onTap: followLink,
          title: Text(item.title),
          padding: const .all(10),
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
