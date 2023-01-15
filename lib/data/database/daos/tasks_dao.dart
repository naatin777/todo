import 'package:drift/drift.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/tables/tasks.dart';

part 'tasks_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(AppDatabase db) : super(db);

  Future<List<Task>> selectTasksFromProject(String projectId) {
    return (select(tasks)..where((tbl) => tbl.projectId.equals(projectId)))
        .get();
  }

  Stream<List<Task>> watchTasksFromProject(String projectId) {
    return (select(tasks)..where((tbl) => tbl.projectId.equals(projectId)))
        .watch();
  }

  Future<Task?> selectTask(String taskId) {
    return (select(tasks)..where((tbl) => tbl.id.equals(taskId)))
        .getSingleOrNull();
  }

  Stream<Task?> watchTask(String taskId) {
    return (select(tasks)..where((tbl) => tbl.id.equals(taskId)))
        .watchSingleOrNull();
  }

  Future<int> insertTask(Task task) {
    return into(tasks).insert(task.toCompanion(true));
  }

  Future<int> updateTask(Task task) {
    return (update(tasks)..where((tbl) => tbl.id.equals(task.id)))
        .write(task.toCompanion(true));
  }

  Future<int> deleteTask(Task task) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(task.id))).go();
  }
}
