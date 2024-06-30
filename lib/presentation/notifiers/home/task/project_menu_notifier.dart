import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:behavior/data/repositories/projects_repository_impl.dart';
import 'package:behavior/domain/models/task_list.dart';

part 'project_menu_notifier.g.dart';

@riverpod
class ProjectMenuNotifier extends _$ProjectMenuNotifier {
  @override
  void build() {}

  Future<void> deleteProject(Project project) async {
    final projectsRepository = ref.watch(projectsRepositoryProvider);
    projectsRepository.deleteProject(project.id);
  }
}
