import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:uuid/uuid.dart';

class AddNewProjectProvider {
  AddNewProjectProvider(this.titleController);

  TextEditingController titleController;
  final uuid = const Uuid();

  Future<void> addNewProject() async {
    final projectsDao = AppDatabase.getInstance().projectsDao;
    await projectsDao
        .insert(Project(id: uuid.v4(), title: titleController.text));
    titleController.clear();
  }
}

final addNewProjectProvider = Provider.autoDispose((ref) {
  final titleController = ref.watch(addNewProjectTitleProvider);
  return AddNewProjectProvider(titleController);
});

final addNewProjectTitleProvider = Provider.autoDispose((ref) {
  return TextEditingController();
});
