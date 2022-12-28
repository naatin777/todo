import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/daos/projects_dao.dart';
import 'package:todo/ui/providers/projects_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewProjectProvider {
  AddNewProjectProvider(this.titleController, this.projectsDao);

  final TextEditingController titleController;
  final ProjectsDao projectsDao;

  final uuid = const Uuid();

  Future<void> addNewProject() async {
    await projectsDao.insertProject(
      Project(id: uuid.v4(), title: titleController.text),
    );
    titleController.clear();
  }
}

final addNewProjectProvider = Provider.autoDispose((ref) {
  final titleController = ref.watch(addNewProjectTitleProvider);
  final projectsDao = ref.watch(projectsProvider);
  return AddNewProjectProvider(titleController, projectsDao);
});

final addNewProjectTitleProvider = Provider.autoDispose((ref) {
  final titleController = TextEditingController();
  ref.onDispose(() {
    titleController.dispose();
  });
  return titleController;
});
