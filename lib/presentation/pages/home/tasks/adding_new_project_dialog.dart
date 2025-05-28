import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morph_todo/presentation/notifiers/home/task/adding_new_project_notifier.dart';

class AddingNewProjectDialog extends ConsumerStatefulWidget {
  const AddingNewProjectDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddingNewProjectDialogState();
}

class _AddingNewProjectDialogState
    extends ConsumerState<AddingNewProjectDialog> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add new project"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await ref
                .read(addingNewProjectNotifierProvider.notifier)
                .addNewProject(titleController.text);
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
