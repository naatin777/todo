import 'package:drift/web.dart';
import 'package:behavior/data/database/app_database.dart';

AppDatabase constructDb() {
  return AppDatabase(WebDatabase('todo'));
}
