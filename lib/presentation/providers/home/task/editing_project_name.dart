import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/domain/repositories/projects_repository.dart';
import 'package:todo/presentation/providers/projects_provider.dart';
import 'package:uuid/uuid.dart';

class EditingProjectNameProvider {
  EditingProjectNameProvider(
      this._titleController, this._projectsRepository, this._project);

  final TextEditingController _titleController;
  final ProjectsRepository _projectsRepository;
  final Project _project;

  final uuid = const Uuid();

  Future<void> changeProjectName() async {
    await _projectsRepository.updateProject(
      _project.copyWith(name: _titleController.text),
    );
    _titleController.clear();
  }
}

final editingProjectNameProvider =
    Provider.autoDispose.family((ref, Project project) {
  final titleController = ref.watch(editingProjectNameTitleProvider(project));
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return EditingProjectNameProvider(
      titleController, projectsRepository, project);
});

final editingProjectNameTitleProvider =
    Provider.autoDispose.family((ref, Project project) {
  final titleController = TextEditingController(text: project.name);
  ref.onDispose(() {
    titleController.dispose();
  });
  return titleController;
});
