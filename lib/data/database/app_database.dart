import 'package:drift/drift.dart';
import 'package:morph_todo/data/database/daos/filters_dao.dart';
import 'package:morph_todo/data/database/daos/labels_dao.dart';
import 'package:morph_todo/data/database/daos/projects_dao.dart';
import 'package:morph_todo/data/database/daos/tasks_dao.dart';
import 'package:morph_todo/data/database/shared.dart';
import 'package:morph_todo/domain/enums/priority.dart';
import 'package:morph_todo/domain/tables/filters.dart';
import 'package:morph_todo/domain/tables/labels.dart';
import 'package:morph_todo/domain/tables/projects.dart';
import 'package:morph_todo/domain/tables/tasks.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Tasks, Projects, Labels, Filters],
  daos: [TasksDao, ProjectsDao, LabelsDao, FiltersDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  static final AppDatabase _instance = constructDb();

  static AppDatabase getInstance() => _instance;
}
