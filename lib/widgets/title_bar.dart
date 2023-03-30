import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Octicons.mark_github),
      title: Text(name ?? 'Please wait...'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
