import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/presentation/notifiers/home/task/editing_project_name.dart';

class EditingProjectNameDialog extends ConsumerStatefulWidget {
  const EditingProjectNameDialog({super.key, required this.project});

  final Project project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditingProjectNameDialogState();
}

class _EditingProjectNameDialogState
    extends ConsumerState<EditingProjectNameDialog> {
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.project.name;
  }

  @override
  void dispose() {
    nameController.dispose();
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
            controller: nameController,
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
                .read(editingProjectNameProvider(widget.project))
                .changeProjectName(nameController.text);
            nameController.clear();
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
