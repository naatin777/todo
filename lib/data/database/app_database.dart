import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/daos/filters_dao.dart';
import 'package:todo/data/database/daos/labels_dao.dart';
import 'package:todo/data/database/daos/projects_dao.dart';
import 'package:todo/data/database/daos/tasks_dao.dart';
import 'package:todo/domain/enums/priority.dart';
import 'package:todo/domain/tables/filters.dart';
import 'package:todo/domain/tables/labels.dart';
import 'package:todo/domain/tables/projects.dart';
import 'package:todo/domain/tables/tasks.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Tasks, Projects, Labels, Filters],
  daos: [TasksDao, ProjectsDao, LabelsDao, FiltersDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: "todo",
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
    );
  }

  static final StateProvider<AppDatabase> provider = StateProvider((ref) {
    final database = AppDatabase();
    ref.onDispose(() {
      database.close();
    });
    return database;
  });
}
