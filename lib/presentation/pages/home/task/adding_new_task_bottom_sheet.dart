import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date.dart';
import 'package:todo/presentation/pages/home/task/due_date_dialog.dart';
import 'package:todo/presentation/pages/home/task/priority_selection_dialog.dart';
import 'package:todo/presentation/pages/home/task/project_selection_bottom_sheet.dart';
import 'package:todo/presentation/notifiers/home/task/adding_new_task_notifier.dart';
import 'package:todo/presentation/notifiers/task_list_id_provider.dart';

class AddingNewTaskBottomSheet extends ConsumerStatefulWidget {
  const AddingNewTaskBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddingNewTaskBottomSheetState();
}

class _AddingNewTaskBottomSheetState
    extends ConsumerState<AddingNewTaskBottomSheet> {
  final titleController = TextEditingController();
  final titleFocusNode = FocusNode();
  final descriptionController = TextEditingController();
  final descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    titleController.dispose();
    titleFocusNode.dispose();
    descriptionController.dispose();
    descriptionFocusNode.dispose();
    super.dispose();
  }

  void saveTask(WidgetRef ref) {
    ref.read(addingNewTaskNotifierProvider.notifier).saveTask(
          titleController.text,
          descriptionController.text,
        );
    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final listId = ref.watch(taskListIdProvider);
    final addingNewTask = ref.watch(addingNewTaskNotifierProvider);
    final project =
        ref.watch(projectFromIdStreamProvider(addingNewTask.projectId));
    final dueDateChipText = ref.watch(dueDateChipTextProvider(listId));
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
              saveTask(ref);
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
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    final DueDate? result = await showDialog(
                      context: context,
                      builder: (context) => DueDateDialog(
                        dueDate: DueDate(
                          dateTime: addingNewTask.dueDate,
                          isAllDay: addingNewTask.isAllDay,
                        ),
                      ),
                    );
                    ref.read(addingNewTask.notifier).changeDueDate(result);
                  },
                  label: Text(
                    dueDateChipText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  icon: Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    final Priority? result = await showDialog(
                      context: context,
                      builder: (context) => PrioritySelectionDialog(
                        priority: addingNewTask.priority,
                      ),
                    );
                    ref.read(addingNewTask.notifier).changePriority(result);
                  },
                  label: Text(
                    "P${addingNewTask.priority.number}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  icon: Icon(
                    Icons.priority_high,
                    color: addingNewTask.priority.color ??
                        Theme.of(context).colorScheme.onBackground,
                  ),
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
                      .read(addingNewTaskNotifierProvider.notifier)
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
                          data?.name ?? inbox.name,
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
                    onPressed: value.text.isEmpty ? null : () => saveTask(ref),
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
