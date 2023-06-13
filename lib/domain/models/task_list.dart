import 'package:todo/data/database/app_database.dart';

sealed class TaskList {}

class Project extends ProjectTable implements TaskList {
  const Project({required super.id, required super.name});

  @override
  Project copyWith({String? id, String? name}) => Project(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

class Label extends LabelTable implements TaskList {
  const Label({required super.id, required super.name});
}

class Filter extends FilterTable implements TaskList {
  const Filter({required super.id, required super.name});
}
