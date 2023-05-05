import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/presentation/providers/home/screens/task/project_drawer_provider.dart';
import 'package:todo/presentation/providers/home/screens/task/project_menu_provider.dart';
import 'package:todo/presentation/providers/home/screens/task/task_tile_provider.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(projectDrawerProvider);
    final tasks = ref.watch(tasksFromProjectIdStreamProvider(project.id));
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(project.title),
          pinned: true,
          actions: [
            PopupMenuButton<ProjectMenuItem>(
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
        tasks.when(
          data: (data) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final task = data[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      ref.read(taskTileProvider).changeDone(task, value);
                    },
                    fillColor: MaterialStateProperty.all(() {
                      switch (task.priority) {
                        case Priority.critical:
                          return Colors.red;
                        case Priority.high:
                          return Colors.yellow;
                        case Priority.medium:
                          return Colors.blue;
                        default:
                          return Colors.grey;
                      }
                    }()),
                  ),
                  title: Text(task.title),
                  subtitle:
                      task.description.isEmpty ? null : Text(task.description),
                  onTap: () {
                    GoRouter.of(context).push("/detail/${task.id}");
                  },
                );
              },
              childCount: data.length,
            ),
          ),
          loading: () => const SliverPadding(
            padding: EdgeInsets.all(0),
          ),
          error: (error, stackTrace) => const SliverPadding(
            padding: EdgeInsets.all(0),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(50),
        ),
      ],
    );
  }
}
