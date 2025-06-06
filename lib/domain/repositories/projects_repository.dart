import 'package:todo/domain/models/task_list.dart';

abstract class ProjectsRepository {
  Future<List<Project>> getAllProjects();
  Stream<List<Project>> watchAllProjects();
  Future<Project?> getProject(String id);
  Stream<Project?> watchProject(String id);
  Future<void> createProject(final String title);
  Future<void> updateProject(final Project project);
  Future<void> deleteProject(final String id);
}
