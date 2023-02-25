import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';

final tasksProvider =
    Provider.autoDispose((ref) => AppDatabase.getInstance().tasksDao);

final tasksFromProjectIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String id) {
  final tasksDao = ref.watch(tasksProvider);
  return tasksDao.watchTasksFromProject(id);
});

final taskFromTaskIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String taskId) {
  final tasksDao = ref.watch(tasksProvider);
  return tasksDao.watchTask(taskId);
});
