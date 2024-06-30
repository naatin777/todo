import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:behavior/data/database/app_database.dart';
import 'package:behavior/data/repositories/tasks_repository_impl.dart';

part 'task_list_tile_notifier.g.dart';

@riverpod
class TaskListTileNotifier extends _$TaskListTileNotifier {
  @override
  void build() {}

  Future<void> changeDone(Task task, bool? value) async {
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    tasksRepository.updateTask(task.copyWith(isDone: value));
  }
}
