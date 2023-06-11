import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/presentation/providers/projects_provider.dart';

part 'task_drawer.g.dart';

@riverpod
Stream<List<Project>> allProjects(AllProjectsRef ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchAllProjects();
}
