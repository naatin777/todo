import 'package:drift/drift.dart';

@DataClassName("ProjectTable")
class Projects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
}
