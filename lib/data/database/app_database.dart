import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/data/database/tables/projects.dart';
import 'package:todo/data/database/tables/tasks.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Tasks, Projects], daos: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  static final AppDatabase _instance = _constructDb();

  static AppDatabase getInstance() => _instance;
}

AppDatabase _constructDb() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
  return AppDatabase(db);
}
