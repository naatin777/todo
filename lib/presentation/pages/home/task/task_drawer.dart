import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/navigation_item.dart';
import 'package:todo/presentation/pages/home/task/adding_new_project_dialog.dart';
import 'package:todo/presentation/providers/home/task/task_drawer.dart';
import 'package:todo/presentation/providers/list_id_provider.dart';
import 'package:todo/presentation/route/route.dart';

class TaskDrawer extends ConsumerWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(allProjectsProvider);
    final listId = ref.watch(listIdProvider);
    return projects.when(
      data: (data) => NavigationDrawer(
        selectedIndex: () {
          if (listId == inbox.id) {
            return 0;
          } else {
            return data
                    .asMap()
                    .entries
                    .firstWhere((element) => element.value.id == listId)
                    .key +
                1;
          }
        }(),
        onDestinationSelected: (int index) {
          if (index == 1 + data.length) {
            showDialog(
              context: context,
              builder: (context) => const AddingNewProjectDialog(),
            );
          } else {
            for (final e in data.asMap().entries) {
              if (e.key == index) {
                HomeRoute(NavigationItems.task.name, id: inbox.id).go(context);
              }
              if (e.key + 1 == index) {
                HomeRoute(NavigationItems.task.name, id: e.value.id)
                    .go(context);
              }
            }
            Navigator.of(context).pop();
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
            label: Text(inbox.title),
            selectedIcon: const Icon(Icons.inbox_outlined),
          ),
          for (final e in data)
            NavigationDrawerDestination(
              icon: const Icon(Icons.list),
              label: Text(e.title),
              selectedIcon: const Icon(Icons.list_outlined),
            ),
          const Divider(),
          const NavigationDrawerDestination(
            icon: Icon(Icons.add),
            label: Text("Add new project"),
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
