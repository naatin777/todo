import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/repositories/labels_repository_impl.dart';
import 'package:todo/domain/repositories/labels_repository.dart';

final labelsRepositoryProvider = Provider.autoDispose<LabelsRepository>(
    (ref) => LabelsRepositoryImpl(AppDatabase.getInstance().labelsDao));
