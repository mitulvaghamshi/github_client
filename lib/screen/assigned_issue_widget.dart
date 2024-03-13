import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:github_client/widgets/future_list_builder.dart';
import 'package:url_launcher/link.dart';

@immutable
class AssignedIssueWidget extends StatelessWidget {
  const AssignedIssueWidget({super.key, required this.future});

  final AsyncValueGetter<Iterable<Issue>> future;

  @override
  Widget build(BuildContext context) => FutureListBuilder<Issue>(
    future: future,
    builder: (context, item) => Link(
      uri: .tryParse(item.url.value),
      builder: (context, followLink) => CupertinoListTile(
        onTap: followLink,
        title: Text(item.title),
        padding: const .all(10),
        subtitle: Text(
          '${item.repository.nameWithOwner} '
          'Issue #${item.number} '
          'Opened by ${item.author!.login}',
        ),
      ),
    ),
  );
}
