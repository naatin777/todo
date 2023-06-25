import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/models/due_date.dart';
import 'package:todo/presentation/notifiers/task_list_id_provider.dart';

part 'adding_new_task_notifier.g.dart';

@riverpod
class AddingNewTaskNotifier extends _$AddingNewTaskNotifier {
  @override
  Task build() {
    final projectId = ref.watch(taskListIdProvider);
    return Task(
      id: "",
      projectId: projectId,
      isDone: false,
      title: "",
      description: "",
      priority: Priority.low,
      isAllDay: true,
    );
  }

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
    final tasksRepository = ref.watch(tasksRepositoryProvider);
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

final projectFromIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String projectId) {
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return projectsRepository.watchProject(projectId);
});

final dueDateChipTextProvider = Provider.autoDispose.family((ref, String id) {
  final addingNewTask = ref.watch(addingNewTaskNotifierProvider);
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
