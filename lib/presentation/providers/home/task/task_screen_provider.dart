import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/providers/list_id_provider.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

final tasksFromProjectIdStreamProvider = StreamProvider.autoDispose((ref) {
  final listId = ref.watch(listIdProvider);
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return tasksRepository.watchTasksFromProject(listId);
});
