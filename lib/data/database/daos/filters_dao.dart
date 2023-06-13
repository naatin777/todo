import 'package:drift/drift.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/tables/filters.dart';

part 'filters_dao.g.dart';

@DriftAccessor(tables: [Filters])
class FiltersDao extends DatabaseAccessor<AppDatabase> with _$FiltersDaoMixin {
  FiltersDao(AppDatabase db) : super(db);

  Future<List<FilterTable>> selectAll() async {
    return select(filters).get();
  }

  Stream<List<FilterTable>> watchAll() {
    return select(filters).watch();
  }

  Future<FilterTable?> selectFilter(String id) async {
    return (select(filters)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<FilterTable?> watchFilter(String id) {
    return (select(filters)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<int> insertFilter(FilterTable filter) async {
    return into(filters).insert(filter);
  }

  Future<int> updateFilter(FilterTable filter) async {
    return (update(filters)..where((tbl) => tbl.id.equals(filter.id)))
        .write(filter);
  }

  Future<int> deleteFilter(String id) async {
    return (delete(filters)..where((tbl) => tbl.id.equals(id))).go();
  }
}
