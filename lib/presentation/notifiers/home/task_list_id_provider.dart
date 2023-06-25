import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_list_id_provider.g.dart';

@riverpod
class TaskListId extends _$TaskListId {
  @override
  String build() => "";

  void changeListId(String listId) {
    state = listId;
  }
}
