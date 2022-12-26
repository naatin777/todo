import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';

final projectsProvider =
    Provider.autoDispose((ref) => AppDatabase.getInstance().projectsDao);
