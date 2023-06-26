import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/navigation_item.dart';
import 'package:todo/domain/enums/project_menu_item.dart';
import 'package:todo/presentation/pages/home/task/editing_project_name_dialog.dart';
import 'package:todo/presentation/notifiers/home/task/project_menu_notifier.dart';
import 'package:todo/presentation/notifiers/home/task/task_app_bar.dart';
import 'package:todo/presentation/route/route.dart';

class TaskAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TaskAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsyncValue = ref.watch(taskAppBarProvider);
    return projectAsyncValue.when(
      data: (project) {
        if (project != null) {
          return AppBar(
            title: Text(project.name),
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
                          HomeRoute(NavigationItems.task.name, id: inbox.id)
                              .go(context);
                          await ref
                              .read(projectMenuNotifierProvider.notifier)
                              .deleteProject(project);
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
        } else {
          return AppBar();
        }
      },
      loading: () => AppBar(),
      error: (error, stackTrace) => AppBar(),
    );
  }
}
