import 'package:drift/drift.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/tables/tasks.dart';

part 'tasks_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(AppDatabase db) : super(db);

  Future<List<Task>> selectTasksFromProject(String projectId) async {
    return (select(tasks)..where((tbl) => tbl.projectId.equals(projectId)))
        .get();
  }

  Stream<List<Task>> watchTasksFromProject(String projectId) {
    return (select(tasks)..where((tbl) => tbl.projectId.equals(projectId)))
        .watch();
  }

  Future<Task?> selectTask(String id) async {
    return (select(tasks)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<Task?> watchTask(String id) {
    return (select(tasks)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<int> insertTask(Task task) async {
    return into(tasks).insert(task);
  }

  Future<int> updateTask(Task task) async {
    return (update(tasks)..where((tbl) => tbl.id.equals(task.id))).write(task);
  }

  Future<int> deleteTask(String id) async {
    return (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
  }
}
