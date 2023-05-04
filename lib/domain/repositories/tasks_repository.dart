import 'package:todo/data/database/app_database.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasksFromProject(String projectId);
  Stream<List<Task>> watchTasksFromProject(String projectId);
  Future<Task?> getTask(String id);
  Stream<Task?> watchTask(String id);
  Future<void> createTask(
    final String projectId,
    final bool done,
    final String title,
    final String description,
    final int priority,
  );
  Future<void> updateTask(final Task task);
  Future<void> deleteTask(final String id);
}
