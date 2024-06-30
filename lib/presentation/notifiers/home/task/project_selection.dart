import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:behavior/data/repositories/projects_repository_impl.dart';
import 'package:behavior/domain/models/task_list.dart';

part 'project_selection.g.dart';

@riverpod
Stream<List<Project>> projects(ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchAllProjects();
}
