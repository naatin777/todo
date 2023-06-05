import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/providers/projects_provider.dart';

final projectsStreamProvider = StreamProvider.autoDispose((ref) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchAllProjects();
});
