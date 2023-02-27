import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/daos/tasks_dao.dart';
import 'package:todo/ui/providers/tasks_provider.dart';

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
  DetailProvider({required this.tasksDao});

  final TasksDao tasksDao;

  Future<void> deleteTask(Task task) async {
    await tasksDao.deleteTask(task);
  }
}

final detailProvider = Provider.autoDispose((ref) {
  final tasksDao = ref.watch(tasksProvider);
  return DetailProvider(tasksDao: tasksDao);
});
