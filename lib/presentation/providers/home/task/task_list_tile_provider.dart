import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/repositories/tasks_repository.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

class TaskListTileProvider {
  TaskListTileProvider(this._tasksRepository);
  final TasksRepository _tasksRepository;

  Future<void> changeDone(Task task, bool? value) async {
    _tasksRepository.updateTask(task.copyWith(isDone: value));
  }
}

final taskListTileProvider = Provider.autoDispose((ref) {
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return TaskListTileProvider(tasksRepository);
});
