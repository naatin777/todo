import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/enums/navigation_item.dart';
import 'package:todo/presentation/pages/home/settings/settings_app_bar.dart';
import 'package:todo/presentation/pages/home/settings/settings_screen.dart';
import 'package:todo/presentation/pages/home/task/adding_new_task_fab.dart';
import 'package:todo/presentation/pages/home/task/task_app_bar.dart';
import 'package:todo/presentation/pages/home/task/task_drawer.dart';
import 'package:todo/presentation/pages/home/task/task_screen.dart';
import 'package:todo/presentation/route/route.dart';

class Home extends ConsumerWidget {
  const Home({super.key, required this.nav, required this.listId});

  final String nav;
  final String? listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationItems = NavigationItems.values.byName(nav);
    return Scaffold(
      appBar: [
        const TaskAppBar(),
        null,
        null,
        const SettingsAppBar(),
      ][navigationItems.index],
      drawer: [
        const TaskDrawer(),
        null,
        null,
        null,
      ][navigationItems.index],
      body: [
        const TaskScreen(),
        null,
        null,
        const SettingsScreen(),
      ][navigationItems.index],
      floatingActionButton: [
        const AddingNewTaskFab(),
        null,
        null,
        null,
      ][navigationItems.index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationItems.index,
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
          HomeRoute(
            NavigationItems.values[index].name,
            listId: listId,
          ).go(context);
        },
      ),
    );
  }
}
