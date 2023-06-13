import 'package:todo/domain/models/task_list.dart';

abstract class FiltersRepository {
  Future<List<Filter>> getAllFilters();
  Stream<List<Filter>> watchAllFilters();
  Future<Filter?> getFilter(String id);
  Stream<Filter?> watchFilter(String id);
  Future<void> createFilter(final String title);
  Future<void> updateFilter(final Filter filter);
  Future<void> deleteFilter(final String id);
}
