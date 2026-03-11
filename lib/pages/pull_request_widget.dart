import 'package:flutter/cupertino.dart';
import 'package:github_client/utils/utils.dart';
import 'package:github_client/widgets/future_list_builder.dart';
import 'package:url_launcher/link.dart';

@immutable
class PullRequestWidget extends StatelessWidget {
  const PullRequestWidget({super.key, required this.future});

  final AsyncList<PullReq> future;

  @override
  Widget build(BuildContext context) => FutureListBuilder(
    future: future,
    builder: (context, item) => Link(
      uri: .tryParse(item.url.value),
      builder: (context, followLink) => CupertinoListTile(
        onTap: followLink,
        padding: const .all(10),
        title: Text(item.title),
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
