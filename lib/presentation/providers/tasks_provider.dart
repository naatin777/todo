import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/tasks_repository_impl.dart';
import 'package:todo/domain/repositories/tasks_repository.dart';

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>(
    (ref) => TasksRepositoryImpl(AppDatabase.getInstance().tasksDao));
