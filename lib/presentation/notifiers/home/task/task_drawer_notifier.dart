import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:behavior/domain/models/task_list.dart';
import 'package:behavior/domain/usecases/task_list_usecase.dart';

part 'task_drawer_notifier.g.dart';

@riverpod
class TaskDrawerNotifier extends _$TaskDrawerNotifier {
  @override
  Future<List<TaskList>> build() async {
    final taskListUseCase = ref.watch(taskListUseCaseProvider);
    return taskListUseCase.getAllTaskList();
  }
}
