import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/domain/models/task_list.dart';

part 'project_selection.g.dart';

@riverpod
Stream<List<Project>> projects(ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchAllProjects();
}
