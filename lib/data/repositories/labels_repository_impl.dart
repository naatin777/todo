import 'package:todo/data/database/daos/labels_dao.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/domain/repositories/labels_repository.dart';
import 'package:uuid/uuid.dart';

class LabelsRepositoryImpl implements LabelsRepository {
  final LabelsDao _labelsDao;
  final Uuid _uuid = const Uuid();

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
        (event) => event.map((e) => Label(id: e.id, name: e.name)).toList());
  }

  @override
  Future<Label?> getLabel(String id) async {
    final label = await _labelsDao.selectLabel(id);
    return label != null ? Label(id: label.id, name: label.name) : null;
  }

  @override
  Stream<Label?> watchLabel(String id) {
    final label = _labelsDao.watchLabel(id);
    return label.map((event) =>
        event != null ? Label(id: event.id, name: event.name) : null);
  }

  @override
  Future<void> createLabel(final String title) async {
    await _labelsDao.insertLabel(
      Label(
        id: _uuid.v4(),
        name: title,
      ),
    );
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
