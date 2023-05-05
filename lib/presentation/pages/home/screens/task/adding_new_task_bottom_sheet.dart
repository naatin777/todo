import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date_model.dart';
import 'package:todo/presentation/pages/home/screens/task/due_date_dialog.dart';
import 'package:todo/presentation/pages/home/screens/task/priority_selection_dialog.dart';
import 'package:todo/presentation/pages/home/screens/task/project_selection_bottom_sheet.dart';
import 'package:todo/presentation/providers/home/screens/task/adding_new_task_provider.dart';
import 'package:todo/presentation/providers/projects_provider.dart';

class AddingNewTaskBottomSheet extends ConsumerWidget {
  const AddingNewTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addingNewTask = ref.watch(addingNewTaskProvider);
    final titleController = ref.watch(addingNewTaskTitleControllerProvider);
    final titleFocusNode = ref.watch(addingNewTaskTitleFocusNodeProvider);
    final descriptionController =
        ref.watch(addingNewTaskDescriptionControllerProvider);
    final descriptionFocusNode =
        ref.watch(addingNewTaskDescriptionFocusNodeProvider);
    final project =
        ref.watch(projectFromIdStreamProvider(addingNewTask.projectId));
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
              ref.read(addingNewTaskProvider.notifier).saveTask();
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
                          dateTime: addingNewTask.dueDate,
                          isAllDay: addingNewTask.isAllDay,
                        ),
                      ),
                    );
                    ref
                        .read(addingNewTaskProvider.notifier)
                        .changeDueDate(result);
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
                        color: addingNewTask.priority.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text("P${addingNewTask.priority.number}"),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    final Priority? result = await showDialog(
                      context: context,
                      builder: (context) => PrioritySelectionDialog(
                        priority: addingNewTask.priority,
                      ),
                    );
                    ref
                        .read(addingNewTaskProvider.notifier)
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
                  final String? result = await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ProjectSelectionBottomSheet(
                        projectId: addingNewTask.projectId,
                      );
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                  );
                  ref
                      .read(addingNewTaskProvider.notifier)
                      .changeProject(result);
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
                            ref.read(addingNewTaskProvider.notifier).saveTask();
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
