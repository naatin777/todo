import 'package:drift/web.dart';
import 'package:todo/data/database/app_database.dart';

AppDatabase constructDb() {
  return AppDatabase(WebDatabase('todo'));
}
