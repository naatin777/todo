import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/domain/repositories/projects_repository.dart';

class EditingProjectNameProvider {
  EditingProjectNameProvider(this._projectsRepository, this._project);

  final ProjectsRepository _projectsRepository;
  final Project _project;

  Future<void> changeProjectName(String name) async {
    await _projectsRepository.updateProject(
      _project.copyWith(name: name),
    );
  }
}

final editingProjectNameProvider =
    Provider.autoDispose.family((ref, Project project) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return EditingProjectNameProvider(projectsRepository, project);
});
