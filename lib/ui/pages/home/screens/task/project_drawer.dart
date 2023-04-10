import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/ui/pages/home/screens/task/add_new_project_dialog.dart';
import 'package:todo/ui/providers/project_drawer_provider.dart';

class ProjectDrawer extends ConsumerWidget {
  const ProjectDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectDrawerStreamProvider);
    final projectDrawer = ref.watch(projectDrawerProvider);
    return projects.when(
      data: (data) => NavigationDrawer(
        selectedIndex: () {
          if (projectDrawer.id == inbox.id) {
            return 0;
          } else {
            return data
                    .asMap()
                    .entries
                    .firstWhere(
                        (element) => element.value.id == projectDrawer.id)
                    .key +
                1;
          }
        }(),
        onDestinationSelected: (int index) {
          if (index == 1 + data.length) {
            showDialog(
              context: context,
              builder: (context) => const AddNewProjectDialog(),
            );
          } else {
            ref.read(projectDrawerProvider.notifier).changeProject(() {
              for (final e in data.asMap().entries) {
                if (e.key + 1 == index) {
                  return e.value;
                }
              }
              return inbox;
            }());
            Navigator.of(context).pop();
          }
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              "Lists",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const Divider(),
          NavigationDrawerDestination(
            icon: const Icon(Icons.inbox),
            label: Text(inbox.title),
            selectedIcon: const Icon(Icons.inbox_outlined),
          ),
          const Divider(),
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
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.inbox),
              title: Text(inbox.title),
              onTap: () {
                ref.read(projectDrawerProvider.notifier).changeProject(inbox);
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              height: 0,
            ),
            projects.when(
              data: (data) => Column(
                children: data
                    .map(
                      (e) => ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(e.title),
                        onTap: () {
                          ref
                              .read(projectDrawerProvider.notifier)
                              .changeProject(e);
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                    .toList(),
              ),
              error: (error, stackTrace) => ListTile(
                title: Text(error.toString()),
                subtitle: Text(stackTrace.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add new project"),
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => const AddNewProjectDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
