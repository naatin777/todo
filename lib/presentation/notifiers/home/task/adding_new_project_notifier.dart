import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';

part 'adding_new_project_notifier.g.dart';

@riverpod
class AddingNewProjectNotifier extends _$AddingNewProjectNotifier {
  @override
  void build() {}

  Future<void> addNewProject(String title) async {
    final projectsRepository = ref.watch(projectsRepositoryProvider);
    await projectsRepository.createProject(title);
  }
}
