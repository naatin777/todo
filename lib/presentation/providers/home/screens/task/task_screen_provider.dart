import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/providers/home/screens/task/project_drawer_provider.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

final tasksFromProjectIdStreamProvider = StreamProvider.autoDispose((ref) {
  final project = ref.watch(projectDrawerProvider);
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return tasksRepository.watchTasksFromProject(project.id);
});
