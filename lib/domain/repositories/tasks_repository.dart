import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/enums/priority.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasksFromProject(String projectId);
  Stream<List<Task>> watchTasksFromProject(String projectId);
  Future<Task?> getTask(String id);
  Stream<Task?> watchTask(String id);
  Future<void> createTask(
    final String projectId,
    final bool isDone,
    final String title,
    final String description,
    final Priority priority,
    final bool isAllDay,
  );
  Future<void> updateTask(final Task task);
  Future<void> deleteTask(final String id);
}
