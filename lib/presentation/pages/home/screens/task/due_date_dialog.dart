import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/models/due_date_model.dart';
import 'package:todo/presentation/providers/home/screens/task/due_date_provider.dart';

class DueDateDialog extends ConsumerStatefulWidget {
  const DueDateDialog({super.key, required this.dueDate});
  final DueDateModel dueDate;

  @override
  ConsumerState<DueDateDialog> createState() => _DueDateDialogState();
}

class _DueDateDialogState extends ConsumerState<DueDateDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dueDateProvider.notifier).changeDate(widget.dueDate.dateTime);
      ref.read(dueDateProvider.notifier).toggleAllDay(widget.dueDate.isAllDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dueDate = ref.watch(dueDateProvider);
    final formattedDate = ref.watch(formattedDateProvider);
    final formattedTime = ref.watch(formattedTimeProvider);
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: Text(formattedDate),
            onTap: () async {
              final now = DateTime.now();
              final result = await showDatePicker(
                context: context,
                initialDate: dueDate.dateTime ?? now,
                firstDate: DateTime(now.year - 100),
                lastDate: DateTime(now.year + 100),
              );
              ref.read(dueDateProvider.notifier).changeDate(result);
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: Text(formattedTime),
            onTap: () async {
              final now = TimeOfDay.now();
              final result = await showTimePicker(
                context: context,
                initialTime: now,
              );
              ref.read(dueDateProvider.notifier).changeTime(result);
            },
            enabled: dueDate.dateTime != null,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            ref.read(dueDateProvider.notifier).clear();
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
                Navigator.of(context).pop(dueDate);
              },
              child: const Text("OK"),
            ),
          ],
        )
      ],
    );
  }
}
