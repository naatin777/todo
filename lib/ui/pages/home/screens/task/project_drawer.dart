import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/ui/pages/home/screens/task/add_new_project_dialog.dart';
import 'package:todo/ui/providers/project_drawer_provider.dart';

class ProjectDrawer extends ConsumerWidget {
  const ProjectDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectDrawerStreamProvider);
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
