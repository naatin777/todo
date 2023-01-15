import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/ui/providers/add_new_task_provider.dart';
import 'package:todo/ui/providers/deadline_provider.dart';
import 'package:todo/ui/providers/project_drawer_provider.dart';
import 'package:todo/ui/providers/projects_provider.dart';

class AddNewTaskFab extends StatelessWidget {
  const AddNewTaskFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            final size = MediaQuery.of(context).size;
            final viewInsets = MediaQuery.of(context).viewInsets;
            final preferredSize = AppBar().preferredSize;
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height - preferredSize.height,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: viewInsets.bottom,
                ),
                child: const AddNewTaskBottomSheet(),
              ),
            );
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          isScrollControlled: true,
        );
      },
    );
  }
}

class AddNewTaskBottomSheet extends ConsumerWidget {
  const AddNewTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addNewTask = ref.watch(addNewTaskProvider);
    final titleController = ref.watch(addNewTaskTitleControllerProvider);
    final titleFocusNode = ref.watch(addNewTaskTitleFocusNodeProvider);
    final descriptionController =
        ref.watch(addNewTaskDescriptionControllerProvider);
    final descriptionFocusNode =
        ref.watch(addNewTaskDescriptionFocusNodeProvider);
    final project =
        ref.watch(projectFromIdStreamProvider(addNewTask.projectId));
    final deadlineChipText = ref.watch(deadlineChipTextProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: titleController,
            focusNode: titleFocusNode,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              border: InputBorder.none,
              hintText: "Title",
            ),
            textInputAction: TextInputAction.done,
            style: const TextStyle(fontSize: 20),
            autofocus: true,
            autocorrect: false,
            onEditingComplete: () {
              ref.read(addNewTaskProvider.notifier).saveTask();
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: descriptionController,
            focusNode: descriptionFocusNode,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              border: InputBorder.none,
              hintText: "Description",
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: InputChip(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  label: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(deadlineChipText),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const DeadlineDialog(),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: InputChip(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  label: Row(
                    children: [
                      const Icon(
                        Icons.priority_high,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text("p${addNewTask.priority + 1}"),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const PrioritySelectionDialog(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: MediaQuery.of(context).padding.bottom + 4.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ProjectSelectionBottomSheet();
                    },
                  );
                },
                child: Row(
                  children: [
                    project.when(
                      data: (data) => ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 104,
                        ),
                        child: Text(
                          data?.title ?? inbox.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      loading: () => const SizedBox(),
                      error: (error, stackTrace) => const SizedBox(),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: titleController,
                builder: (context, value, child) {
                  return IconButton(
                    onPressed: value.text.isEmpty
                        ? null
                        : () {
                            ref.read(addNewTaskProvider.notifier).saveTask();
                          },
                    icon: const Icon(Icons.send),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectSelectionBottomSheet extends ConsumerWidget {
  const ProjectSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addNewTask = ref.watch(addNewTaskProvider);
    final projects = ref.watch(projectsStreamProvider);
    return projects.when(
      data: (data) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.inbox),
              title: Text(inbox.title),
              onTap: () {
                ref.read(addNewTaskProvider.notifier).changeProject(inbox.id);
                Navigator.of(context).pop();
              },
              selected: addNewTask.projectId == inbox.id,
            ),
            const Divider(
              height: 0,
            ),
            for (Project project in data)
              ListTile(
                leading: const Icon(Icons.list),
                title: Text(project.title),
                onTap: () {
                  ref
                      .read(addNewTaskProvider.notifier)
                      .changeProject(project.id);
                  Navigator.of(context).pop();
                },
                selected: addNewTask.projectId == project.id,
              ),
          ],
        ),
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}

class DeadlineDialog extends ConsumerStatefulWidget {
  const DeadlineDialog({super.key});

  @override
  ConsumerState<DeadlineDialog> createState() => _DeadlineDialogState();
}

class _DeadlineDialogState extends ConsumerState<DeadlineDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final date =
          ref.watch(addNewTaskProvider.select((value) => value.deadlineDate));
      final time =
          ref.watch(addNewTaskProvider.select((value) => value.deadlineTime));
      ref.read(deadlineProvider.notifier).changeDateTime(date);
      ref
          .read(deadlineProvider.notifier)
          .changeTimeOfDay(time != null ? TimeOfDay.fromDateTime(time) : null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final deadline = ref.watch(deadlineProvider);
    final dateTime = deadline.dateTime;
    final timeOfDay = deadline.timeOfDay;
    final dateFormat = DateFormat('yyyy-MM-dd');
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Date"),
            onTap: () async {
              final now = DateTime.now();
              final result = await showDatePicker(
                context: context,
                initialDate: deadline.dateTime ?? now,
                firstDate: DateTime(now.year - 100),
                lastDate: DateTime(now.year + 100),
              );
              ref.read(deadlineProvider.notifier).changeDateTime(result);
            },
            subtitle:
                dateTime != null ? Text(dateFormat.format(dateTime)) : null,
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text("Time"),
            onTap: () async {
              final now = TimeOfDay.now();
              final result = await showTimePicker(
                context: context,
                initialTime: now,
              );
              ref.read(deadlineProvider.notifier).changeTimeOfDay(result);
            },
            subtitle:
                timeOfDay != null ? Text(timeOfDay.format(context)) : null,
            enabled: deadline.dateTime != null,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            ref.read(deadlineProvider.notifier).clear();
          },
          child: const Text("Clear"),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref
                    .read(addNewTaskProvider.notifier)
                    .changeDateTime(dateTime, timeOfDay);
              },
              child: const Text("OK"),
            ),
          ],
        )
      ],
    );
  }
}

class PrioritySelectionDialog extends ConsumerWidget {
  const PrioritySelectionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addNewTask = ref.watch(addNewTaskProvider);
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: Priority.values.map((e) {
          return ListTile(
            leading: Icon(
              Icons.priority_high,
              color: e.color,
            ),
            title: Text("P${(e.index + 1)}"),
            trailing: Radio(
              value: e,
              groupValue: Priority.values[addNewTask.priority],
              onChanged: (value) {
                ref.read(addNewTaskProvider.notifier).changePriority(e.index);
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              ref.read(addNewTaskProvider.notifier).changePriority(e.index);
              Navigator.of(context).pop();
            },
          );
        }).toList(),
      ),
    );
  }
}
