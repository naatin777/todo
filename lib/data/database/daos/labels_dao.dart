import 'package:drift/drift.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/tables/labels.dart';

part 'labels_dao.g.dart';

@DriftAccessor(tables: [Labels])
class LabelsDao extends DatabaseAccessor<AppDatabase> with _$LabelsDaoMixin {
  LabelsDao(super.db);

  Future<List<LabelTable>> selectAll() async {
    return select(labels).get();
  }

  Stream<List<LabelTable>> watchAll() {
    return select(labels).watch();
  }

  Future<LabelTable?> selectLabel(String id) async {
    return (select(
      labels,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<LabelTable?> watchLabel(String id) {
    return (select(
      labels,
    )..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();
  }

  Future<int> insertLabel(LabelTable label) async {
    return into(labels).insert(label);
  }

  Future<int> updateLabel(LabelTable label) async {
    return (update(
      labels,
    )..where((tbl) => tbl.id.equals(label.id))).write(label);
  }

  Future<int> deleteLabel(String id) async {
    return (delete(labels)..where((tbl) => tbl.id.equals(id))).go();
  }
}
