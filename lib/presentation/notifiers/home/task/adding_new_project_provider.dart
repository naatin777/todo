import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/domain/repositories/projects_repository.dart';
import 'package:uuid/uuid.dart';

class AddingNewProjectProvider {
  AddingNewProjectProvider(this._projectsRepository);

  final ProjectsRepository _projectsRepository;

  final uuid = const Uuid();

  Future<void> addNewProject(String title) async {
    await _projectsRepository.createProject(title);
  }
}

final addingNewProjectProvider = Provider.autoDispose((ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return AddingNewProjectProvider(projectsRepository);
});
