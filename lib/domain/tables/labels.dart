import 'package:drift/drift.dart';

@DataClassName("LabelTable")
class Labels extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
}
