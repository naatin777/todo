import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/ui/providers/navigation_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigation.index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.check),
            selectedIcon: Icon(Icons.check_outlined),
            label: "Task",
            tooltip: "Task",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search_outlined),
            label: "Search",
            tooltip: "Search",
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics),
            selectedIcon: Icon(Icons.analytics_outlined),
            label: "Analytics",
            tooltip: "Analytics",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(Icons.settings_outlined),
            label: "Settings",
            tooltip: "Settings",
          ),
        ],
        onDestinationSelected: (index) {
          ref.read(navigationProvider.notifier).changeNavigation(index);
        },
      ),
    );
  }
}
