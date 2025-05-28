import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/models/due_date.dart';
import 'package:todo/presentation/notifiers/home/task/due_date_notifier.dart';

class DueDateDialog extends ConsumerStatefulWidget {
  const DueDateDialog({super.key, required this.dueDate});
  final DueDate dueDate;

  @override
  ConsumerState<DueDateDialog> createState() => _DueDateDialogState();
}

class _DueDateDialogState extends ConsumerState<DueDateDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(dueDateNotifierProvider.notifier)
          .changeDate(widget.dueDate.dateTime);
      ref
          .read(dueDateNotifierProvider.notifier)
          .toggleAllDay(widget.dueDate.isAllDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dueDate = ref.watch(dueDateNotifierProvider);
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
              ref.read(dueDateNotifierProvider.notifier).changeDate(result);
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
              ref.read(dueDateNotifierProvider.notifier).changeTime(result);
            },
            enabled: dueDate.dateTime != null,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            ref.read(dueDateNotifierProvider.notifier).clear();
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
        ),
      ],
    );
  }
}
