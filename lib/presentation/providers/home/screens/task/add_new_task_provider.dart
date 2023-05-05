import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/daos/tasks_dao.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date_model.dart';
import 'package:todo/presentation/providers/home/screens/task/project_drawer_provider.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';
import 'package:uuid/uuid.dart';

part 'add_new_task_provider.g.dart';

class AddNewTaskProvider extends StateNotifier<Task> {
  static const uuid = Uuid();

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  final TasksDao tasksDao;

  AddNewTaskProvider({
    required String projectId,
    required this.titleController,
    required this.descriptionController,
    required this.tasksDao,
  }) : super(Task(
            id: uuid.v4(),
            projectId: projectId,
            isDone: false,
            title: "",
            description: "",
            priority: Priority.low,
            isAllDay: true));

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
    await tasksDao.insertTask(
      state.copyWith(
        title: titleController.text,
        description: descriptionController.text,
      ),
    );
    titleController.clear();
    descriptionController.clear();
    state = state.copyWith(
      id: uuid.v4(),
      title: "",
      description: "",
      priority: Priority.low,
    );
  }
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

final addNewTaskProvider =
    StateNotifierProvider.autoDispose<AddNewTaskProvider, Task>((ref) {
  final project = ref.watch(projectDrawerProvider);
  final TextEditingController titleController =
      ref.watch(addNewTaskTitleControllerProvider);
  final descriptionController =
      ref.watch(addNewTaskDescriptionControllerProvider);
  final tasksDao = ref.watch(tasksProvider);
  return AddNewTaskProvider(
    projectId: project.id,
    titleController: titleController,
    descriptionController: descriptionController,
    tasksDao: tasksDao,
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
