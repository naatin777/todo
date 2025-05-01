import 'package:drift/web.dart';
import 'package:morph_todo/data/database/app_database.dart';

AppDatabase constructDb() {
  return AppDatabase(WebDatabase('todo'));
}
