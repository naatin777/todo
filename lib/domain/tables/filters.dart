import 'package:drift/drift.dart';

@DataClassName("FilterTable")
class Filters extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
}
