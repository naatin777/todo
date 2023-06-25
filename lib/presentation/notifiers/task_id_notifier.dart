import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_id_notifier.g.dart';

@riverpod
class TaskIdNotifier extends _$TaskIdNotifier {
  @override
  String build() => "";

  void changeTaskId(String taskId) {
    state = taskId;
  }
}
