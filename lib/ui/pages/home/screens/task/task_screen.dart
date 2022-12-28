import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/ui/providers/project_drawer_provider.dart';
import 'package:todo/ui/providers/project_menu_provider.dart';

class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(projectDrawerProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(project.title),
          floating: true,
          snap: true,
          actions: [
            PopupMenuButton<ProjectMenuItem>(
              color: Theme.of(context).colorScheme.secondaryContainer,
              onSelected: (ProjectMenuItem value) {
                switch (value) {
                  case ProjectMenuItem.delete:
                    ref.read(projectMenuProvider).deleteProject(project);
                    ref
                        .read(projectDrawerProvider.notifier)
                        .changeProject(inbox);
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: ProjectMenuItem.delete,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0.0,
                      title: Text("Delete project"),
                      leading: Icon(Icons.delete),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ],
    );
  }
}
