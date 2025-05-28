import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/pages/home/tasks/adding_new_task_fab.dart';

class AnimatedBranchContainer extends StatelessWidget {
  /// Creates a AnimatedBranchContainer
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  /// The index (in [children]) of the branch Navigator to display.
  final int currentIndex;

  /// The children (branch Navigators) to display in this container.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.asMap().entries.map((navigator) {
        return AnimatedScale(
          scale: navigator.key == currentIndex ? 1 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedOpacity(
            opacity: navigator.key == currentIndex ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: _branchNavigatorWrapper(navigator.key, navigator.value),
          ),
        );
      }).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
    ignoring: index != currentIndex,
    child: TickerMode(enabled: index == currentIndex, child: navigator),
  );
}

class Home extends ConsumerWidget {
  const Home({
    super.key,
    required this.navigationShell,
    required this.id,
    required this.children,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            body: AnimatedBranchContainer(
              currentIndex: navigationShell.currentIndex,
              children: children,
            ),
            // body: navigationShell.,
            floatingActionButton: AddingNewTaskFab(),
            bottomNavigationBar: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.task_alt),
                  selectedIcon: Icon(Icons.task_alt_outlined),
                  label: "Tasks",
                  tooltip: "Tasks",
                ),
                NavigationDestination(
                  icon: Icon(Icons.event_note),
                  selectedIcon: Icon(Icons.event_note_outlined),
                  label: "Schedule",
                  tooltip: "Schedule",
                ),
                NavigationDestination(
                  icon: Icon(Icons.analytics),
                  selectedIcon: Icon(Icons.analytics_outlined),
                  label: "Analytics",
                  tooltip: "Analytics",
                ),
                NavigationDestination(
                  icon: Icon(Icons.hub),
                  selectedIcon: Icon(Icons.hub_outlined),
                  label: "Hub",
                  tooltip: "Hub",
                ),
              ],
              onDestinationSelected: (index) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  navigationShell.goBranch(
                    index,
                    initialLocation: index == navigationShell.currentIndex,
                  );
                });
              },
            ),
          );
        } else {
          return Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavigationRail(
                  labelType: NavigationRailLabelType.all,
                  leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.task_alt),
                      selectedIcon: Icon(Icons.task_alt_outlined),
                      label: Text("Tasks"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.event_note),
                      selectedIcon: Icon(Icons.event_note_outlined),
                      label: Text("Schedule"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.analytics),
                      selectedIcon: Icon(Icons.analytics_outlined),
                      label: Text("Analytics"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.hub),
                      selectedIcon: Icon(Icons.hub_outlined),
                      label: Text("Hub"),
                    ),
                  ],
                  selectedIndex: navigationShell.currentIndex,
                  onDestinationSelected: (index) {
                    navigationShell.goBranch(index);
                  },
                ),
                Expanded(
                  child: AnimatedBranchContainer(
                    currentIndex: navigationShell.currentIndex,
                    children: children,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
