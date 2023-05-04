import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/daos/projects_dao.dart';
import 'package:todo/domain/repositories/projects_repository.dart';
import 'package:uuid/uuid.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsDao _projectsDao;
  final Uuid _uuid = const Uuid();

  const ProjectsRepositoryImpl(this._projectsDao);

  @override
  Future<List<Project>> getAllProjects() async {
    return _projectsDao.selectAll();
  }

  @override
  Stream<List<Project>> watchAllProjects() {
    return _projectsDao.watchAll();
  }

  @override
  Future<Project?> getProject(String id) async {
    return _projectsDao.selectProject(id);
  }

  @override
  Stream<Project?> watchProject(String id) {
    return _projectsDao.watchProject(id);
  }

  @override
  Future<void> createProject(final String title) async {
    await _projectsDao.insertProject(
      Project(
        id: _uuid.v4(),
        title: title,
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
