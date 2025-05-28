import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/presentation/notifiers/task_list_id_provider.dart';

part 'task_screen_notifier.g.dart';

@riverpod
class TaskScreenNotifier extends _$TaskScreenNotifier {
  @override
  Future<List<Task>> build() {
    final listId = ref.watch(taskListIdProvider);
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    return tasksRepository.getTasksFromProject(listId);
  }

  Future<void> changeCheck(Task task, bool? isDone) async {
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    final changedTask = task.copyWith(isDone: isDone);
    await tasksRepository.updateTask(changedTask);
    state = AsyncData(
      await tasksRepository.getTasksFromProject(task.projectId),
    );
  }
}
