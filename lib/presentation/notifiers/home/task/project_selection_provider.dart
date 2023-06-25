import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';

final projectsStreamProvider = StreamProvider.autoDispose((ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchAllProjects();
});
