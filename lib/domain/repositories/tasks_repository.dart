import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date_model.dart';

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
    final DueDateModel dueDate,
  );
  Future<void> updateTask(final Task task);
  Future<void> deleteTask(final String id);
}
