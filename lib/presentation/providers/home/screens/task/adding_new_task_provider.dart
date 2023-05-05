import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date_model.dart';
import 'package:todo/domain/repositories/tasks_repository.dart';
import 'package:todo/presentation/providers/home/screens/task/project_drawer_provider.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

part 'adding_new_task_provider.g.dart';

class AddingNewTaskProvider extends StateNotifier<Task> {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  final TasksRepository tasksRepository;

  AddingNewTaskProvider({
    required String projectId,
    required this.titleController,
    required this.descriptionController,
    required this.tasksRepository,
  }) : super(
          Task(
            id: "",
            projectId: projectId,
            isDone: false,
            title: "",
            description: "",
            priority: Priority.low,
            isAllDay: true,
          ),
        );

  void changeProject(String? projectId) {
    if (projectId != null) {
      state = state.copyWith(projectId: projectId);
    }
  }

  void changeDueDate(DueDateModel? dueDate) {
    if (dueDate != null) {
      state = state.copyWith(
        dueDate: Value(dueDate.dateTime),
        isAllDay: dueDate.isAllDay,
      );
    }
  }

  void changePriority(Priority? value) {
    if (value != null) {
      state = state.copyWith(priority: value);
    }
  }

  Future<void> saveTask() async {
    await tasksRepository.createTask(
      state.projectId,
      false,
      titleController.text,
      descriptionController.text,
      state.priority,
      DueDateModel(dateTime: state.dueDate, isAllDay: state.isAllDay),
    );
    titleController.clear();
    descriptionController.clear();
    state = state.copyWith(
      id: "",
      title: "",
      description: "",
      priority: Priority.low,
    );
  }
}

final addingNewTaskProvider =
    StateNotifierProvider.autoDispose<AddingNewTaskProvider, Task>((ref) {
  final project = ref.watch(projectDrawerProvider);
  final TextEditingController titleController =
      ref.watch(addingNewTaskTitleControllerProvider);
  final TextEditingController descriptionController =
      ref.watch(addingNewTaskDescriptionControllerProvider);
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return AddingNewTaskProvider(
    projectId: project.id,
    titleController: titleController,
    descriptionController: descriptionController,
    tasksRepository: tasksRepository,
  );
});

@riverpod
TextEditingController addingNewTaskTitleController(Ref ref) {
  final titleController = TextEditingController();
  ref.onDispose(() {
    titleController.dispose();
  });
  return titleController;
}

@riverpod
FocusNode addingNewTaskTitleFocusNode(Ref ref) {
  final titleFocusNode = FocusNode();
  ref.onDispose(() {
    titleFocusNode.dispose();
  });
  return titleFocusNode;
}

@riverpod
TextEditingController addingNewTaskDescriptionController(Ref ref) {
  final descriptionController = TextEditingController();
  ref.onDispose(() {
    descriptionController.dispose();
  });
  return descriptionController;
}

@riverpod
FocusNode addingNewTaskDescriptionFocusNode(Ref ref) {
  final descriptionFocusNode = FocusNode();
  ref.onDispose(() {
    descriptionFocusNode.dispose();
  });
  return descriptionFocusNode;
}

final dueDateChipTextProvider = Provider.autoDispose((ref) {
  final addingNewTask = ref.watch(addingNewTaskProvider);
  final dueDate = addingNewTask.dueDate;
  final isAllDay = addingNewTask.isAllDay;
  final dateFormat = DateFormat("yyyy-MM-dd");
  final dateTimeFormat = DateFormat("yyyy-MM-dd hh:mm");
  if (dueDate != null) {
    if (isAllDay) {
      return dateFormat.format(dueDate);
    } else {
      return dateTimeFormat.format(dueDate);
    }
  } else {
    return "Due Date";
  }
});
