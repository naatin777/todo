import 'package:drift/drift.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/data/database/tables/projects.dart';

part 'projects_dao.g.dart';

@DriftAccessor(tables: [Projects])
class ProjectsDao extends DatabaseAccessor<AppDatabase>
    with _$ProjectsDaoMixin {
  ProjectsDao(AppDatabase db) : super(db);

  Future<List<Project>> selectAll() {
    return select(projects).get();
  }

  Stream<List<Project>> watchAll() {
    return select(projects).watch();
  }

  Future<int> insert(Project project) {
    return into(projects).insert(project);
  }
}
