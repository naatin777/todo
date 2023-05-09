import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/repositories/tasks_repository.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

final detailTitleProvider = Provider.autoDispose.family(
  (ref, String arg) {
    final titleProvider = TextEditingController(text: arg);
    ref.onDispose(() {
      titleProvider.dispose();
    });
    return titleProvider;
  },
);

final detailDescriptionProvider = Provider.autoDispose.family(
  (ref, String arg) {
    final descriptionProvider = TextEditingController(text: arg);
    ref.onDispose(() {
      descriptionProvider.dispose();
    });
    return descriptionProvider;
  },
);

class DetailProvider {
  DetailProvider(this._tasksRepository);

  final TasksRepository _tasksRepository;

  Future<void> deleteTask(Task task) async {
    await _tasksRepository.deleteTask(task.id);
  }

  Future<void> updateTitle(String title, Task task) async {
    await _tasksRepository.updateTask(task.copyWith(title: title));
  }

  Future<void> updateDescription(String description, Task task) async {
    await _tasksRepository.updateTask(task.copyWith(description: description));
  }
}

final detailProvider = Provider.autoDispose((ref) {
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return DetailProvider(tasksRepository);
});
