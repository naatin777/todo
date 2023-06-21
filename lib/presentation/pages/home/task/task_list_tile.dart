import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/presentation/providers/home/task/task_screen.dart';
import 'package:todo/presentation/route/route.dart';

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
      leading: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          ref.read(taskScreenProvider.notifier).changeDone(task, value);
        },
        fillColor: MaterialStateProperty.all(
            task.priority.color ?? Theme.of(context).colorScheme.onBackground),
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
        DetailsRoute(task.id).push(context);
      },
    );
  }
}
