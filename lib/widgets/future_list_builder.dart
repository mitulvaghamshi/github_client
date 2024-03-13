import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

typedef ValueBuilder<T> = Widget Function(BuildContext, T);

@immutable
class FutureListBuilder<T> extends StatelessWidget {
  const FutureListBuilder({
    super.key,
    required this.future,
    required this.builder,
  });

  final AsyncValueGetter<Iterable<T>> future;
  final ValueBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<T>>(
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
          itemBuilder: (context, index) =>
              builder(context, items.elementAt(index)),
        );
      },
    );
  }
}
