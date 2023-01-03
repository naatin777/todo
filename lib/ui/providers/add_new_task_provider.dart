import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/ui/providers/project_drawer_provider.dart';
import 'package:uuid/uuid.dart';

part 'add_new_task_provider.g.dart';

class AddNewTaskProvider extends StateNotifier<Task> {
  static const uuid = Uuid();

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  AddNewTaskProvider({
    required String projectId,
    required this.titleController,
    required this.descriptionController,
  }) : super(Task(
            id: uuid.v4(),
            projectId: projectId,
            done: false,
            title: "",
            description: "",
            priority: Priority.low.index));

  void changeProject(String projectId) {
    state = state.copyWith(projectId: projectId);
  }
}

enum Priority {
  critical(Colors.red),
  high(Colors.yellow),
  medium(Colors.blue),
  low(null);

  final Color? color;

  const Priority(this.color);
}

final addNewTaskProvider =
    StateNotifierProvider.autoDispose<AddNewTaskProvider, Task>((ref) {
  final project = ref.watch(projectDrawerProvider);
  final TextEditingController titleController =
      ref.watch(addNewTaskTitleControllerProvider);
  final descriptionController =
      ref.watch(addNewTaskDescriptionControllerProvider);
  return AddNewTaskProvider(
    projectId: project.id,
    titleController: titleController,
    descriptionController: descriptionController,
  );
});

@riverpod
TextEditingController addNewTaskTitleController(Ref ref) {
  final titleController = TextEditingController();
  ref.onDispose(() {
    titleController.dispose();
  });
  return titleController;
}

@riverpod
FocusNode addNewTaskTitleFocusNode(Ref ref) {
  final titleFocusNode = FocusNode();
  ref.onDispose(() {
    titleFocusNode.dispose();
  });
  return titleFocusNode;
}

@riverpod
TextEditingController addNewTaskDescriptionController(Ref ref) {
  final descriptionController = TextEditingController();
  ref.onDispose(() {
    descriptionController.dispose();
  });
  return descriptionController;
}

@riverpod
FocusNode addNewTaskDescriptionFocusNode(Ref ref) {
  final descriptionFocusNode = FocusNode();
  ref.onDispose(() {
    descriptionFocusNode.dispose();
  });
  return descriptionFocusNode;
}
