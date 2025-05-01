import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:morph_todo/data/repositories/projects_repository_impl.dart';
import 'package:morph_todo/domain/models/task_list.dart';

part 'editing_project_name_notifier.g.dart';

@riverpod
class EditingProjectNameNotifier extends _$EditingProjectNameNotifier {
  @override
  void build() {}

  Future<void> changeProjectName(Project project, String name) async {
    final projectsRepository = ref.watch(projectsRepositoryProvider);
    await projectsRepository.updateProject(project.copyWith(name: name));
  }
}
