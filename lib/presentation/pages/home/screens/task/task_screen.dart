import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/presentation/providers/home/screens/task/task_screen_provider.dart';
import 'package:todo/presentation/providers/home/screens/task/task_tile_provider.dart';

class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksFromProjectIdStreamProvider);
    return CustomScrollView(
      slivers: [
        tasks.when(
          data: (data) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final task = data[index];
                return TaskListTile(task: task);
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

class TaskListTile extends ConsumerStatefulWidget {
  const TaskListTile({super.key, required this.task});
  final Task task;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskListTileState();
}

class _TaskListTileState extends ConsumerState<TaskListTile> {
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final now = DateTime.now();
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      leading: Transform.scale(
        scale: 1.25,
        child: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            ref.read(taskTileProvider).changeDone(task, value);
          },
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.transparent;
            }
            return task.priority.color ??
                Theme.of(context).colorScheme.onBackground;
          }),
          checkColor:
              task.priority.color ?? Theme.of(context).colorScheme.onBackground,
          shape: const CircleBorder(),
          side: BorderSide(
            width: 1.5,
            color: task.priority.color ??
                Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      title: Text(task.title),
      subtitle: task.description.isNotEmpty || task.dueDate != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (task.description.isNotEmpty) Text(task.description),
                if (task.dueDate != null)
                  Text(() {
                    final difference = now.difference(task.dueDate!);
                    return "${-difference.inHours}:${-difference.inMinutes.remainder(60)}:${(-difference.inSeconds.remainder(60))}";
                  }()),
              ],
            )
          : null,
      onTap: () {
        GoRouter.of(context).push("/detail/${task.id}");
      },
    );
  }
}
