import 'package:freezed_annotation/freezed_annotation.dart';

part 'due_date.freezed.dart';

@freezed
abstract class DueDate with _$DueDate {
  const factory DueDate({
    required DateTime? dateTime,
    required bool isAllDay,
  }) = _DueDate;
}
