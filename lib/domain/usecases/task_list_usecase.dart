import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/repositories/filters_repository_impl.dart';
import 'package:todo/data/repositories/labels_repository_impl.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/domain/repositories/filters_repository.dart';
import 'package:todo/domain/repositories/labels_repository.dart';
import 'package:todo/domain/repositories/projects_repository.dart';

part 'task_list_usecase.g.dart';

@riverpod
TaskListUseCase taskListUseCase(TaskListUseCaseRef ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  final labelsRepository = ref.watch(labelsRepositoryProvider);
  final filtersRepository = ref.watch(filtersRepositoryProvider);
  return TaskListUseCase(
    projectsRepository: projectsRepository,
    labelsRepository: labelsRepository,
    filtersRepository: filtersRepository,
  );
}

class TaskListUseCase {
  TaskListUseCase({
    required this.projectsRepository,
    required this.labelsRepository,
    required this.filtersRepository,
  });

  ProjectsRepository projectsRepository;
  LabelsRepository labelsRepository;
  FiltersRepository filtersRepository;

  Future<List<TaskList>> getAllTaskList() async {
    final projects = await projectsRepository.getAllProjects();
    final labels = await labelsRepository.getAllLabels();
    final filters = await filtersRepository.getAllFilters();
    return projects.cast<TaskList>() +
        labels.cast<TaskList>() +
        filters.cast<TaskList>();
  }
}
