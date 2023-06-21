import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/presentation/providers/list_id_provider.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

part 'task_screen.g.dart';

@riverpod
class TaskScreen extends _$TaskScreen {
  @override
  Future<List<Task>> build() {
    final listId = ref.watch(listIdProvider);
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
