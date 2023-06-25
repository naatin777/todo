import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date.dart';
import 'package:todo/domain/repositories/tasks_repository.dart';
import 'package:todo/presentation/notifiers/home/task_list_id_provider.dart';

// part 'adding_new_task_provider.g.dart';

class AddingNewTaskProvider extends StateNotifier<Task> {
  final TasksRepository tasksRepository;

  AddingNewTaskProvider({
    required String projectId,
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

  void changeDueDate(DueDate? dueDate) {
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

  Future<void> saveTask(String title, String description) async {
    await tasksRepository.createTask(
      state.projectId,
      false,
      title,
      description,
      state.priority,
      DueDate(dateTime: state.dueDate, isAllDay: state.isAllDay),
    );
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
  final listId = ref.watch(taskListIdProvider);
  final tasksRepository = ref.watch(tasksRepositoryProvider);
  return AddingNewTaskProvider(
    projectId: listId,
    tasksRepository: tasksRepository,
  );
});

final projectFromIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String projectId) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchProject(projectId);
});

final dueDateChipTextProvider = Provider.autoDispose.family((ref, String id) {
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
