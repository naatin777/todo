import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';

final projectsProvider =
    Provider.autoDispose((ref) => AppDatabase.getInstance().projectsDao);

final projectFromIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String projectId) {
  final projectsDao = ref.watch(projectsProvider);
  return projectsDao.watchProject(projectId);
});

final projectsStreamProvider = StreamProvider.autoDispose((ref) {
  final projectsDao = ref.watch(projectsProvider);
  return projectsDao.watchAll();
});
