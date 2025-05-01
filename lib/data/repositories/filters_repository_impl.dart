import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morph_todo/constant.dart';
import 'package:morph_todo/data/database/app_database.dart';
import 'package:morph_todo/domain/models/task_list.dart';
import 'package:morph_todo/data/database/daos/filters_dao.dart';
import 'package:morph_todo/domain/repositories/filters_repository.dart';

final filtersRepositoryProvider = Provider.autoDispose<FiltersRepository>(
  (ref) => FiltersRepositoryImpl(AppDatabase.getInstance().filtersDao),
);

class FiltersRepositoryImpl implements FiltersRepository {
  final FiltersDao _filtersDao;

  const FiltersRepositoryImpl(this._filtersDao);

  @override
  Future<List<Filter>> getAllFilters() async {
    final filter = await _filtersDao.selectAll();
    return filter.map((e) => Filter(id: e.id, name: e.name)).toList();
  }

  @override
  Stream<List<Filter>> watchAllFilters() {
    final filter = _filtersDao.watchAll();
    return filter.map(
      (event) => event.map((e) => Filter(id: e.id, name: e.name)).toList(),
    );
  }

  @override
  Future<Filter?> getFilter(String id) async {
    final filter = await _filtersDao.selectFilter(id);
    return filter != null ? Filter(id: filter.id, name: filter.name) : null;
  }

  @override
  Stream<Filter?> watchFilter(String id) {
    final filter = _filtersDao.watchFilter(id);
    return filter.map(
      (event) => event != null ? Filter(id: event.id, name: event.name) : null,
    );
  }

  @override
  Future<void> createFilter(final String title) async {
    await _filtersDao.insertFilter(Filter(id: uuid.v4(), name: title));
  }

  @override
  Future<void> updateFilter(Filter filter) async {
    await _filtersDao.updateFilter(filter);
  }

  @override
  Future<void> deleteFilter(String id) async {
    await _filtersDao.deleteFilter(id);
  }
}
