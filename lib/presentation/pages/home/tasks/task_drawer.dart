import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morph_todo/constant.dart';
import 'package:morph_todo/presentation/notifiers/home/task/task_drawer_notifier.dart';
import 'package:morph_todo/presentation/notifiers/task_list_id_provider.dart';

class TaskDrawer extends ConsumerWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listId = ref.watch(taskListIdProvider);
    final taskLists = ref.watch(taskDrawerNotifierProvider);
    return taskLists.when(
      data:
          (data) => NavigationDrawer(
            selectedIndex: () {
              if (listId == inbox.id) {
                return 0;
              } else {
                return 0;
              }
            }(),
            onDestinationSelected: (int index) {},
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
                child: Text(
                  "Lists",
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
              const Padding(
                padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
                child: Divider(),
              ),
              const NavigationDrawerDestination(
                icon: Icon(Icons.add),
                label: Text("Add new list"),
              ),
            ],
          ),
      error:
          (error, stackTrace) => ListTile(
            title: Text(error.toString()),
            subtitle: Text(stackTrace.toString()),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
