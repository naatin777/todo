import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/daos/projects_dao.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/domain/repositories/projects_repository.dart';

final projectsRepositoryProvider = Provider.autoDispose<ProjectsRepository>(
    (ref) => ProjectsRepositoryImpl(AppDatabase.getInstance().projectsDao));

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsDao _projectsDao;

  const ProjectsRepositoryImpl(this._projectsDao);

  @override
  Future<List<Project>> getAllProjects() async {
    final project = await _projectsDao.selectAll();
    return project.map((e) => Project(id: e.id, name: e.name)).toList();
  }

  @override
  Stream<List<Project>> watchAllProjects() {
    final project = _projectsDao.watchAll();
    return project.map(
        (event) => event.map((e) => Project(id: e.id, name: e.name)).toList());
  }

  @override
  Future<Project?> getProject(String id) async {
    final project = await _projectsDao.selectProject(id);
    return project != null ? Project(id: project.id, name: project.name) : null;
  }

  @override
  Stream<Project?> watchProject(String id) {
    final project = _projectsDao.watchProject(id);
    return project.map((event) =>
        event != null ? Project(id: event.id, name: event.name) : null);
  }

  @override
  Future<void> createProject(final String title) async {
    await _projectsDao.insertProject(
      Project(
        id: uuid.v4(),
        name: title,
      ),
    );
  }

  @override
  Future<void> updateProject(Project project) async {
    await _projectsDao.updateProject(project);
  }

  @override
  Future<void> deleteProject(String id) async {
    await _projectsDao.deleteProject(id);
  }
}
