import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morph_todo/constant.dart';
import 'package:morph_todo/data/database/app_database.dart';
import 'package:morph_todo/data/database/daos/labels_dao.dart';
import 'package:morph_todo/domain/models/task_list.dart';
import 'package:morph_todo/domain/repositories/labels_repository.dart';

final labelsRepositoryProvider = Provider.autoDispose<LabelsRepository>(
  (ref) => LabelsRepositoryImpl(AppDatabase.getInstance().labelsDao),
);

class LabelsRepositoryImpl implements LabelsRepository {
  final LabelsDao _labelsDao;

  const LabelsRepositoryImpl(this._labelsDao);

  @override
  Future<List<Label>> getAllLabels() async {
    final label = await _labelsDao.selectAll();
    return label.map((e) => Label(id: e.id, name: e.name)).toList();
  }

  @override
  Stream<List<Label>> watchAllLabels() {
    final label = _labelsDao.watchAll();
    return label.map(
      (event) => event.map((e) => Label(id: e.id, name: e.name)).toList(),
    );
  }

  @override
  Future<Label?> getLabel(String id) async {
    final label = await _labelsDao.selectLabel(id);
    return label != null ? Label(id: label.id, name: label.name) : null;
  }

  @override
  Stream<Label?> watchLabel(String id) {
    final label = _labelsDao.watchLabel(id);
    return label.map(
      (event) => event != null ? Label(id: event.id, name: event.name) : null,
    );
  }

  @override
  Future<void> createLabel(final String title) async {
    await _labelsDao.insertLabel(Label(id: uuid.v4(), name: title));
  }

  @override
  Future<void> updateLabel(Label label) async {
    await _labelsDao.updateLabel(label);
  }

  @override
  Future<void> deleteLabel(String id) async {
    await _labelsDao.deleteLabel(id);
  }
}
