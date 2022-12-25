import 'package:drift/drift.dart';

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  BoolColumn get done => boolean()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get priority => integer()();
  DateTimeColumn get deadlineDate => dateTime().nullable()();
  DateTimeColumn get deadlineTime => dateTime().nullable()();
}
