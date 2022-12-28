import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/ui/providers/projects_provider.dart';

const inbox = Project(id: "inbox", title: "Inbox");

class ProjectDrawerProvider extends StateNotifier<Project> {
  ProjectDrawerProvider() : super(inbox);

  void changeProject(Project project) {
    state = project;
  }
}

final projectDrawerProvider =
    StateNotifierProvider((ref) => ProjectDrawerProvider());

final projectDrawerStreamProvider = StreamProvider.autoDispose((ref) {
  final projectsDao = ref.watch(projectsProvider);
  return projectsDao.watchAll();
});
