import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_client/utils/utils.dart';

@immutable
class const FutureListBuilder<T>({
  required final AsyncList<T> future,
  required final ValueBuilder<T> builder,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: future(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (snapshot.hasError && kDebugMode) {
        return ErrorWidget(snapshot.error!);
      }
      final items = snapshot.requireData;
      return ListView.builder(
        itemExtent: 60,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return builder(context, items.elementAt(index));
        },
      );
    },
  );
}
