import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/constant.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/presentation/notifiers/task_list_id_provider.dart';

part 'task_app_bar.g.dart';

@riverpod
Stream<Project?> taskAppBar(Ref ref) {
  final listId = ref.watch(taskListIdProvider);
  if (listId == inbox.id) {
    return Stream.value(inbox);
  } else {
    final projectsRepository = ref.watch(projectsRepositoryProvider);
    return projectsRepository.watchProject(listId);
  }
}
