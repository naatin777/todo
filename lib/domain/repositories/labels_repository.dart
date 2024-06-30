import 'package:behavior/domain/models/task_list.dart';

abstract class LabelsRepository {
  Future<List<Label>> getAllLabels();
  Stream<List<Label>> watchAllLabels();
  Future<Label?> getLabel(String id);
  Stream<Label?> watchLabel(String id);
  Future<void> createLabel(final String title);
  Future<void> updateLabel(final Label label);
  Future<void> deleteLabel(final String id);
}
