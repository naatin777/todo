import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';

final tasksProvider =
    Provider.autoDispose((ref) => AppDatabase.getInstance().tasksDao);
