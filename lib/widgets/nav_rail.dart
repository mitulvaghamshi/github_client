import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';

class NavRail extends StatelessWidget {
  const NavRail({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  final int selectedIndex;
  final ValueChanged<int> onChange;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onChange,
      labelType: NavigationRailLabelType.all,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Octicons.repo),
          label: Text('Repository'),
        ),
        NavigationRailDestination(
          icon: Icon(Octicons.issue_opened),
          label: Text('Assigned Issues'),
        ),
        NavigationRailDestination(
          icon: Icon(Octicons.git_pull_request),
          label: Text('Pull Requests'),
        ),
      ],
    );
  }
}
