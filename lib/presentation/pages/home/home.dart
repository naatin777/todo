import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/pages/home/screens/settings/settings_screen.dart';
import 'package:todo/presentation/pages/home/screens/task/adding_new_task_fab.dart';
import 'package:todo/presentation/pages/home/screens/task/project_app_bar.dart';
import 'package:todo/presentation/pages/home/screens/task/project_drawer.dart';
import 'package:todo/presentation/pages/home/screens/task/task_screen.dart';
import 'package:todo/presentation/providers/home/navigation_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationProvider);
    return Scaffold(
      appBar: const [
        ProjectAppBar(),
        null,
        null,
        null,
      ][navigation.index],
      drawer: [
        const ProjectDrawer(),
        null,
        null,
        null,
      ][navigation.index],
      body: [
        const TaskScreen(),
        null,
        null,
        const SettingsScreen(),
      ][navigation.index],
      floatingActionButton: [
        const AddingNewTaskFab(),
        null,
        null,
        null,
      ][navigation.index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigation.index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.task),
            selectedIcon: Icon(Icons.task_outlined),
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
