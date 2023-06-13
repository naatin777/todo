import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/domain/repositories/projects_repository.dart';
import 'package:todo/presentation/providers/projects_provider.dart';

class ProjectMenuProvider {
  ProjectMenuProvider(this._projectsRepository);
  final ProjectsRepository _projectsRepository;

  Future<void> deleteProject(Project project) async {
    _projectsRepository.deleteProject(project.id);
  }
}

final projectMenuProvider = Provider.autoDispose((ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return ProjectMenuProvider(projectsRepository);
});
