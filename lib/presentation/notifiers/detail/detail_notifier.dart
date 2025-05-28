import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/presentation/notifiers/task_id_notifier.dart';

part 'detail_notifier.g.dart';

@riverpod
class DetailNotifier extends _$DetailNotifier {
  @override
  Future<Task?> build() async {
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    final id = ref.watch(taskIdNotifierProvider);
    return tasksRepository.getTask(id);
  }

  Future<void> deleteTask(Task task) async {
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    await tasksRepository.deleteTask(task.id);
  }

  Future<void> updateTitle(String title, Task task) async {
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    await tasksRepository.updateTask(task.copyWith(title: title));
  }

  Future<void> updateCheck(bool check, Task task) async {
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    await tasksRepository.updateTask(task.copyWith(isDone: check));
  }

  Future<void> updateDescription(String description, Task task) async {
    final tasksRepository = ref.watch(tasksRepositoryProvider);
    await tasksRepository.updateTask(task.copyWith(description: description));
  }
}
