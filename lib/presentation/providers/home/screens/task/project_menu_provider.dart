import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/daos/projects_dao.dart';
import 'package:todo/presentation/providers/projects_provider.dart';

class ProjectMenuProvider {
  ProjectMenuProvider(this.projectsDao);
  final ProjectsDao projectsDao;

  Future<void> deleteProject(Project project) async {
    projectsDao.deleteProject(project);
  }
}

final projectMenuProvider = Provider.autoDispose((ref) {
  final projectsDao = ref.watch(projectsProvider);
  return ProjectMenuProvider(projectsDao);
});

enum ProjectMenuItem {
  delete,
}
