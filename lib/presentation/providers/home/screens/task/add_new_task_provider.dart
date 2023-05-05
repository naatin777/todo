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

part 'add_new_task_provider.g.dart';

class AddNewTaskProvider extends StateNotifier<Task> {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  final TasksRepository tasksRepository;

  AddNewTaskProvider({
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

final addNewTaskProvider =
    StateNotifierProvider.autoDispose<AddNewTaskProvider, Task>((ref) {
  final project = ref.watch(projectDrawerProvider);
  final TextEditingController titleController =
      ref.watch(addNewTaskTitleControllerProvider);
  final TextEditingController descriptionController =
      ref.watch(addNewTaskDescriptionControllerProvider);
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return AddNewTaskProvider(
    projectId: project.id,
    titleController: titleController,
    descriptionController: descriptionController,
    tasksRepository: tasksRepository,
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

final dueDateChipTextProvider = Provider.autoDispose((ref) {
  final addNewTask = ref.watch(addNewTaskProvider);
  final dueDate = addNewTask.dueDate;
  final isAllDay = addNewTask.isAllDay;
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
