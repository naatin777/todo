import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/daos/tasks_dao.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

class TaskTileProvider {
  TaskTileProvider(this.tasksDao);
  final TasksDao tasksDao;

  Future<void> changeDone(Task task, bool? value) async {
    tasksDao.updateTask(task.copyWith(done: value));
  }
}

final taskTileProvider = Provider.autoDispose((ref) {
  final tasksDao = ref.watch(tasksProvider);
  return TaskTileProvider(tasksDao);
});
