import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/domain/repositories/tasks_repository.dart';

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>(
    (ref) => TasksRepositoryImpl(AppDatabase.getInstance().tasksDao));

final tasksFromProjectIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String id) {
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return tasksRepository.watchTasksFromProject(id);
});

final taskFromTaskIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String taskId) {
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return tasksRepository.watchTask(taskId);
});
