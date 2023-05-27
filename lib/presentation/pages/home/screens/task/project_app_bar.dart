import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/project_menu_item.dart';
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
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                padding: EdgeInsets.zero,
                value: ProjectMenuItem.delete,
                child: MenuItemButton(
                  leadingIcon: const Icon(Icons.delete),
                  child: const Text("Delete project"),
                  onPressed: () {
                    ref.read(projectMenuProvider).deleteProject(project);
                    ref
                        .read(projectDrawerProvider.notifier)
                        .changeProject(inbox);
                  },
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
