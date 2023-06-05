import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/presentation/providers/projects_provider.dart';

class ProjectDrawerProvider extends StateNotifier<Project> {
  ProjectDrawerProvider() : super(inbox);

  void changeProject(Project project) {
    state = project;
  }
}

final projectDrawerProvider =
    StateNotifierProvider<ProjectDrawerProvider, Project>(
        (ref) => ProjectDrawerProvider());

final projectDrawerStreamProvider = StreamProvider.autoDispose((ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchAllProjects();
});
