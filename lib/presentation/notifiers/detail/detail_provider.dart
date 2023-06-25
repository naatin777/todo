import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/domain/repositories/tasks_repository.dart';

final taskFromTaskIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String taskId) {
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return tasksRepository.watchTask(taskId);
});

class DetailProvider {
  DetailProvider(this._tasksRepository);

  final TasksRepository _tasksRepository;

  Future<void> deleteTask(Task task) async {
    await _tasksRepository.deleteTask(task.id);
  }

  Future<void> updateTitle(String title, Task task) async {
    await _tasksRepository.updateTask(task.copyWith(title: title));
  }

  Future<void> updateCheck(bool check, Task task) async {
    await _tasksRepository.updateTask(task.copyWith(isDone: check));
  }

  Future<void> updateDescription(String description, Task task) async {
    await _tasksRepository.updateTask(task.copyWith(description: description));
  }
}

final detailProvider = Provider.autoDispose((ref) {
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return DetailProvider(tasksRepository);
});
