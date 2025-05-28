import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morph_todo/domain/enums/priority.dart';

class PrioritySelectionDialog extends ConsumerWidget {
  const PrioritySelectionDialog({super.key, required this.priority});

  final Priority priority;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            Priority.values.map((e) {
              return ListTile(
                leading: Icon(
                  Icons.priority_high,
                  color: e.color ?? Theme.of(context).colorScheme.onSurface,
                ),
                title: Text("P${e.number} ${e.name}"),
                trailing: Radio(
                  value: e,
                  groupValue: priority,
                  onChanged: (value) {
                    Navigator.of(context).pop(e);
                  },
                ),
                onTap: () {
                  Navigator.of(context).pop(e);
                },
              );
            }).toList(),
      ),
    );
  }
}
