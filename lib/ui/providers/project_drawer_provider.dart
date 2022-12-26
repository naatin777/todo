import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/ui/providers/projects_provider.dart';

final projectDrawerStreamProvider = StreamProvider.autoDispose((ref) {
  final projectsDao = ref.watch(projectsProvider);
  return projectsDao.watchAll();
});
