import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  final int selectedIndex;
  final ValueChanged<int> onChange;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 60,
      selectedIndex: selectedIndex,
      onDestinationSelected: onChange,
      destinations: const [
        NavigationDestination(
          icon: Icon(Octicons.repo),
          label: 'Repos',
        ),
        NavigationDestination(
          icon: Icon(Octicons.issue_opened),
          label: 'Issues',
        ),
        NavigationDestination(
          icon: Icon(Octicons.git_pull_request),
          label: 'PRs',
        ),
      ],
    );
  }
}
