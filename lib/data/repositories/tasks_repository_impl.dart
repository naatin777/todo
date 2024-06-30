import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:behavior/constant.dart';
import 'package:behavior/data/database/app_database.dart';
import 'package:behavior/data/database/daos/tasks_dao.dart';
import 'package:behavior/domain/enums/priority.dart';
import 'package:behavior/domain/models/due_date.dart';
import 'package:behavior/domain/repositories/tasks_repository.dart';

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>(
    (ref) => TasksRepositoryImpl(AppDatabase.getInstance().tasksDao));

class TasksRepositoryImpl implements TasksRepository {
  final TasksDao _tasksDao;

  const TasksRepositoryImpl(this._tasksDao);

  @override
  Future<List<Task>> getTasksFromProject(String projectId) async {
    return _tasksDao.selectTasksFromProject(projectId);
  }

  @override
  Stream<List<Task>> watchTasksFromProject(String projectId) {
    return _tasksDao.watchTasksFromProject(projectId);
  }

  @override
  Future<Task?> getTask(String id) async {
    return _tasksDao.selectTask(id);
  }

  @override
  Stream<Task?> watchTask(String id) {
    return _tasksDao.watchTask(id);
  }

  @override
  Future<void> createTask(
    final String projectId,
    final bool isDone,
    final String title,
    final String description,
    final Priority priority,
    final DueDate dueDate,
  ) async {
    await _tasksDao.insertTask(
      Task(
        id: uuid.v4(),
        projectId: projectId,
        isDone: isDone,
        title: title,
        description: description,
        priority: priority,
        dueDate: dueDate.dateTime,
        isAllDay: dueDate.isAllDay,
      ),
    );
  }

  @override
  Future<void> updateTask(Task task) async {
    await _tasksDao.updateTask(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    await _tasksDao.deleteTask(id);
  }
}
