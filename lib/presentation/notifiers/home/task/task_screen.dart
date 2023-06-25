import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/presentation/notifiers/home/task_list_id_provider.dart';

part 'task_screen.g.dart';

@riverpod
class TaskScreen extends _$TaskScreen {
  @override
  Future<List<Task>> build() {
    final listId = ref.watch(taskListIdProvider);
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    return tasksRepository.getTasksFromProject(listId);
  }

  Future<void> changeDone(Task task, bool? isDone) async {
    state = state.whenData((value) {
      return value.map((e) {
        if (e.id == task.id) {
          return task.copyWith(isDone: isDone);
        } else {
          return e;
        }
      }).toList();
    });
  }
}
