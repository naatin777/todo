import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/enums/navigation_item.dart';
import 'package:todo/presentation/pages/home/settings/settings_app_bar.dart';
import 'package:todo/presentation/pages/home/settings/settings_screen.dart';
import 'package:todo/presentation/pages/home/task/adding_new_task_fab.dart';
import 'package:todo/presentation/pages/home/task/project_app_bar.dart';
import 'package:todo/presentation/pages/home/task/project_drawer.dart';
import 'package:todo/presentation/pages/home/task/task_screen.dart';
import 'package:todo/presentation/route/route.dart';

class Home extends ConsumerWidget {
  const Home({super.key, required this.nav});

  final String nav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationItem = NavigationItem.values.byName(nav);
    return Scaffold(
      appBar: const [
        ProjectAppBar(),
        null,
        null,
        SettingsAppBar(),
      ][navigationItem.index],
      drawer: [
        const ProjectDrawer(),
        null,
        null,
        null,
      ][navigationItem.index],
      body: [
        const TaskScreen(),
        null,
        null,
        const SettingsScreen(),
      ][navigationItem.index],
      floatingActionButton: [
        const AddingNewTaskFab(),
        null,
        null,
        null,
      ][navigationItem.index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationItem.index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.check_box),
            selectedIcon: Icon(Icons.check_box_outlined),
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
          HomeRoute(NavigationItem.values[index].name).go(context);
        },
      ),
    );
  }
}
