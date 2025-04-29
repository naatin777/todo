import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:behavior/domain/models/due_date.dart';

part 'due_date_notifier.g.dart';

@riverpod
class DueDateNotifier extends _$DueDateNotifier {
  @override
  DueDate build() {
    return DueDate(dateTime: null, isAllDay: true);
  }

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
    state = DueDate(dateTime: null, isAllDay: true);
  }
}

@riverpod
String formattedDate(FormattedDateRef ref) {
  final dueDate = ref.watch(dueDateNotifierProvider);
  final dateTime = dueDate.dateTime;
  if (dateTime != null) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  } else {
    return "Date";
  }
}

@riverpod
String formattedTime(FormattedTimeRef ref) {
  final dueDate = ref.watch(dueDateNotifierProvider);
  final dateTime = dueDate.dateTime;
  if (!dueDate.isAllDay && dateTime != null) {
    return DateFormat('hh:mm').format(dateTime);
  } else {
    return "Time";
  }
}
