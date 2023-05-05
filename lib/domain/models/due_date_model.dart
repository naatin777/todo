import 'package:freezed_annotation/freezed_annotation.dart';

part 'due_date_model.freezed.dart';

@freezed
class DueDateModel with _$DueDateModel {
  const factory DueDateModel({
    required DateTime? dateTime,
    required bool isAllDay,
  }) = _DueDateModel;
}
