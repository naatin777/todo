import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/domain/usecases/task_list_usecase.dart';

part 'task_drawer.g.dart';

@riverpod
class TaskDrawer extends _$TaskDrawer {
  @override
  Future<List<TaskList>> build() async {
    final taskListUseCase = ref.watch(taskListUseCaseProvider);
    return taskListUseCase.getAllTaskList();
  }
}
