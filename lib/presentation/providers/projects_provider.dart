import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/projects_repository_impl.dart';
import 'package:todo/domain/repositories/projects_repository.dart';

final projectsRepositoryProvider = Provider.autoDispose<ProjectsRepository>(
    (ref) => ProjectsRepositoryImpl(AppDatabase.getInstance().projectsDao));
