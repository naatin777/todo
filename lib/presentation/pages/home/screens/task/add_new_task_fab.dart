import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date_model.dart';
import 'package:todo/presentation/pages/home/screens/task/due_date_dialog.dart';
import 'package:todo/presentation/pages/home/screens/task/priority_selection_dialog.dart';
import 'package:todo/presentation/providers/home/screens/task/add_new_task_provider.dart';
import 'package:todo/presentation/providers/home/screens/task/project_drawer_provider.dart';
import 'package:todo/presentation/providers/projects_provider.dart';

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
    final dueDateChipText = ref.watch(dueDateChipTextProvider);
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
                margin: const EdgeInsets.only(left: 12.0, right: 8.0),
                child: ActionChip(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  label: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(dueDateChipText),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    final DueDateModel? result = await showDialog(
                      context: context,
                      builder: (context) => DueDateDialog(
                        dueDate: DueDateModel(
                          dateTime: addNewTask.dueDate,
                          isAllDay: addNewTask.isAllDay,
                        ),
                      ),
                    );
                    ref.read(addNewTaskProvider.notifier).changeDueDate(result);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: ActionChip(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  label: Row(
                    children: [
                      Icon(
                        Icons.priority_high,
                        color: addNewTask.priority.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text("P${addNewTask.priority.number}"),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    final Priority? result = await showDialog(
                      context: context,
                      builder: (context) => PrioritySelectionDialog(
                        priority: addNewTask.priority,
                      ),
                    );
                    ref
                        .read(addNewTaskProvider.notifier)
                        .changePriority(result);
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
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
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
        child: Container(
          margin: const EdgeInsets.only(top: 4.0),
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
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
