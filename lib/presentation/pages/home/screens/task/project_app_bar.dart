import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/project_menu_item.dart';
import 'package:todo/presentation/pages/home/screens/task/editing_project_name_dialog.dart';
import 'package:todo/presentation/providers/home/screens/task/project_drawer_provider.dart';
import 'package:todo/presentation/providers/home/screens/task/project_menu_provider.dart';

class ProjectAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(projectDrawerProvider);
    return AppBar(
      title: Text(project.title),
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
                  onPressed: () async {
                    GoRouter.of(context).pop();
                    await ref.read(projectMenuProvider).deleteProject(project);
                    ref
                        .read(projectDrawerProvider.notifier)
                        .changeProject(inbox);
                  },
                ),
              ),
              PopupMenuItem(
                padding: EdgeInsets.zero,
                value: ProjectMenuItem.edit,
                child: MenuItemButton(
                  leadingIcon: const Icon(Icons.edit),
                  child: const Text("Edit project name"),
                  onPressed: () async {
                    GoRouter.of(context).pop();
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return EditingProjectNameDialog(project: project);
                      },
                    );
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
