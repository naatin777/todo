import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/providers/home/screens/task/add_new_project_provider.dart';

class AddNewProjectDialog extends ConsumerWidget {
  const AddNewProjectDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = ref.watch(addNewProjectTitleProvider);
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
            await ref.read(addNewProjectProvider).addNewProject();
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
