import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/navigation_item.dart';
import 'package:todo/presentation/pages/home/task/adding_new_project_dialog.dart';
import 'package:todo/presentation/notifiers/home/task/task_drawer.dart';

import 'package:todo/presentation/notifiers/home/task_list_id_provider.dart';
import 'package:todo/presentation/route/route.dart';

class TaskDrawer extends ConsumerWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listId = ref.watch(taskListIdProvider);
    final taskLists = ref.watch(taskDrawerProvider);
    return taskLists.when(
      data: (data) => NavigationDrawer(
        selectedIndex: () {
          if (listId == inbox.id) {
            return 0;
          } else {
            return 0;
          }
        }(),
        onDestinationSelected: (int index) {
          if (index == 0) {
            HomeRoute(NavigationItems.task.name, id: inbox.id).go(context);
            Navigator.of(context).pop();
          } else if (0 < index && index < data.length + 1) {
            for (final e in data) {
              HomeRoute(NavigationItems.task.name, id: e.id).go(context);
            }
            Navigator.of(context).pop();
          } else if (index == data.length + 1) {
            showDialog(
              context: context,
              builder: (context) => const AddingNewProjectDialog(),
            );
          }
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              "Projects",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.inbox),
            label: Text(inbox.name),
            selectedIcon: const Icon(Icons.inbox_outlined),
          ),
          for (final e in data)
            NavigationDrawerDestination(
              icon: const Icon(Icons.list),
              label: Text(e.name),
              selectedIcon: const Icon(Icons.list_outlined),
            ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.add),
            label: Text("Add new project"),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              "Labels",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.add),
            label: Text("Add new label"),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.add),
            label: Text("Add new filter"),
          ),
        ],
      ),
      error: (error, stackTrace) => ListTile(
        title: Text(error.toString()),
        subtitle: Text(stackTrace.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
