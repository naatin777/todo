import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/filters_repository_impl.dart';
import 'package:todo/domain/repositories/filters_repository.dart';

final filtersRepositoryProvider = Provider.autoDispose<FiltersRepository>(
    (ref) => FiltersRepositoryImpl(AppDatabase.getInstance().filtersDao));
