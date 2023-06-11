import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/presentation/providers/list_id_provider.dart';
import 'package:todo/presentation/providers/projects_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_app_bar_provider.g.dart';

@riverpod
Stream<Project?> taskAppBar(AutoDisposeRef ref) {
  final listId = ref.watch(listIdProvider);
  if (listId == inbox.id) {
    return Stream.value(inbox);
  } else {
    final projectsRepository = ref.watch(projectsRepositoryProvider);
    return projectsRepository.watchProject(listId);
  }
}
