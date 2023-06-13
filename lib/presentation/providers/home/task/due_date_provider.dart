import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo/domain/models/due_date.dart';

class DueDateProvider extends StateNotifier<DueDate> {
  DueDateProvider() : super(const DueDate(dateTime: null, isAllDay: true));

  void changeDate(DateTime? dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }

  void changeTime(TimeOfDay? timeOfDay) {
    final dateTime = state.dateTime;
    if (dateTime != null && timeOfDay != null) {
      state = state.copyWith(
        dateTime: DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          timeOfDay.hour,
          timeOfDay.minute,
        ),
        isAllDay: false,
      );
    }
  }

  void toggleAllDay(bool isAllDay) {
    state = state.copyWith(isAllDay: isAllDay);
  }

  void clear() {
    state = const DueDate(dateTime: null, isAllDay: true);
  }
}

final dueDateProvider =
    StateNotifierProvider.autoDispose<DueDateProvider, DueDate>(
        (ref) => DueDateProvider());

final formattedDateProvider = Provider.autoDispose((ref) {
  final dueDate = ref.watch(dueDateProvider);
  final dateTime = dueDate.dateTime;
  if (dateTime != null) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  } else {
    return "Date";
  }
});

final formattedTimeProvider = Provider.autoDispose((ref) {
  final dueDate = ref.watch(dueDateProvider);
  final dateTime = dueDate.dateTime;
  if (!dueDate.isAllDay && dateTime != null) {
    return DateFormat('hh:mm').format(dateTime);
  } else {
    return "Time";
  }
});
