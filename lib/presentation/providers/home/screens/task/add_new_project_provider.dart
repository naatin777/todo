import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/repositories/projects_repository.dart';
import 'package:todo/presentation/providers/projects_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewProjectProvider {
  AddNewProjectProvider(this._titleController, this._projectsRepository);

  final TextEditingController _titleController;
  final ProjectsRepository _projectsRepository;

  final uuid = const Uuid();

  Future<void> addNewProject() async {
    await _projectsRepository.createProject(_titleController.text);
    _titleController.clear();
  }
}

final addNewProjectProvider = Provider.autoDispose((ref) {
  final titleController = ref.watch(addNewProjectTitleProvider);
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return AddNewProjectProvider(titleController, projectsRepository);
});

final addNewProjectTitleProvider = Provider.autoDispose((ref) {
  final titleController = TextEditingController();
  ref.onDispose(() {
    titleController.dispose();
  });
  return titleController;
});
