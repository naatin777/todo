import 'package:drift/drift.dart';
import 'package:morph_todo/domain/enums/priority.dart';

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  BoolColumn get isDone => boolean()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get priority => intEnum<Priority>()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isAllDay => boolean()();
}
