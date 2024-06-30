import 'package:drift/drift.dart';
import 'package:behavior/data/database/daos/filters_dao.dart';
import 'package:behavior/data/database/daos/labels_dao.dart';
import 'package:behavior/data/database/daos/projects_dao.dart';
import 'package:behavior/data/database/daos/tasks_dao.dart';
import 'package:behavior/data/database/shared.dart';
import 'package:behavior/domain/enums/priority.dart';
import 'package:behavior/domain/tables/filters.dart';
import 'package:behavior/domain/tables/labels.dart';
import 'package:behavior/domain/tables/projects.dart';
import 'package:behavior/domain/tables/tasks.dart';

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
