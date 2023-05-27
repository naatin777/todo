import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/presentation/providers/home/screens/task/project_drawer_provider.dart';
import 'package:todo/presentation/providers/home/screens/task/project_menu_provider.dart';

class ProjectAppBar extends ConsumerWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(projectDrawerProvider);
    return SliverAppBar(
      title: Text(project.title),
      pinned: true,
      actions: [
        PopupMenuButton<ProjectMenuItem>(
          onSelected: (ProjectMenuItem value) {
            switch (value) {
              case ProjectMenuItem.delete:
                ref.read(projectMenuProvider).deleteProject(project);
                ref.read(projectDrawerProvider.notifier).changeProject(inbox);
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: ProjectMenuItem.delete,
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: MenuItemButton(
                  leadingIcon: Icon(Icons.delete),
                  child: Text("Delete project"),
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
