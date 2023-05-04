import 'package:drift/drift.dart';
import 'package:todo/data/database/app_database.dart';
import 'package:todo/domain/tables/projects.dart';

part 'projects_dao.g.dart';

@DriftAccessor(tables: [Projects])
class ProjectsDao extends DatabaseAccessor<AppDatabase>
    with _$ProjectsDaoMixin {
  ProjectsDao(AppDatabase db) : super(db);

  Future<List<Project>> selectAll() async {
    return select(projects).get();
  }

  Stream<List<Project>> watchAll() {
    return select(projects).watch();
  }

  Future<Project?> selectProject(String id) async {
    return (select(projects)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<Project?> watchProject(String id) {
    return (select(projects)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<int> insertProject(Project project) async {
    return into(projects).insert(project);
  }

  Future<int> updateProject(Project project) async {
    return (update(projects)..where((tbl) => tbl.id.equals(project.id)))
        .write(project);
  }

  Future<int> deleteProject(String id) async {
    return (delete(projects)..where((tbl) => tbl.id.equals(id))).go();
  }
}
