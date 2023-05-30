import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

typedef FutureCallBack<T> = Future<Iterable<T>> Function();
typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);

@immutable
final class FuturePageBuilder<T> extends StatelessWidget {
  const FuturePageBuilder({
    super.key,
    required this.future,
    required this.builder,
  });

  final FutureCallBack<T> future;
  final ItemBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<T>>(
      future: future(),
      builder: (context, snapshot) {
        if (snapshot.hasError && kDebugMode) {
          return Text(snapshot.error.toString());
        } else if (!snapshot.hasData) {
          return const Center(child: CupertinoActivityIndicator());
        }
        final items = snapshot.requireData;
        return ListView.builder(
          itemExtent: 60,
          itemCount: items.length,
          itemBuilder: (context, index) =>
              builder(context, items.elementAt(index)),
        );
      },
    );
  }
}
