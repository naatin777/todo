// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String projectId;
  final bool done;
  final String title;
  final String description;
  final int priority;
  final DateTime? deadlineDate;
  final DateTime? deadlineTime;
  const Task(
      {required this.id,
      required this.projectId,
      required this.done,
      required this.title,
      required this.description,
      required this.priority,
      this.deadlineDate,
      this.deadlineTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['done'] = Variable<bool>(done);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || deadlineDate != null) {
      map['deadline_date'] = Variable<DateTime>(deadlineDate);
    }
    if (!nullToAbsent || deadlineTime != null) {
      map['deadline_time'] = Variable<DateTime>(deadlineTime);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      projectId: Value(projectId),
      done: Value(done),
      title: Value(title),
      description: Value(description),
      priority: Value(priority),
      deadlineDate: deadlineDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineDate),
      deadlineTime: deadlineTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineTime),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      done: serializer.fromJson<bool>(json['done']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      priority: serializer.fromJson<int>(json['priority']),
      deadlineDate: serializer.fromJson<DateTime?>(json['deadlineDate']),
      deadlineTime: serializer.fromJson<DateTime?>(json['deadlineTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'done': serializer.toJson<bool>(done),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'priority': serializer.toJson<int>(priority),
      'deadlineDate': serializer.toJson<DateTime?>(deadlineDate),
      'deadlineTime': serializer.toJson<DateTime?>(deadlineTime),
    };
  }

  Task copyWith(
          {String? id,
          String? projectId,
          bool? done,
          String? title,
          String? description,
          int? priority,
          Value<DateTime?> deadlineDate = const Value.absent(),
          Value<DateTime?> deadlineTime = const Value.absent()}) =>
      Task(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        done: done ?? this.done,
        title: title ?? this.title,
        description: description ?? this.description,
        priority: priority ?? this.priority,
        deadlineDate:
            deadlineDate.present ? deadlineDate.value : this.deadlineDate,
        deadlineTime:
            deadlineTime.present ? deadlineTime.value : this.deadlineTime,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('done: $done, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('deadlineTime: $deadlineTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, done, title, description,
      priority, deadlineDate, deadlineTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.done == this.done &&
          other.title == this.title &&
          other.description == this.description &&
          other.priority == this.priority &&
          other.deadlineDate == this.deadlineDate &&
          other.deadlineTime == this.deadlineTime);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<bool> done;
  final Value<String> title;
  final Value<String> description;
  final Value<int> priority;
  final Value<DateTime?> deadlineDate;
  final Value<DateTime?> deadlineTime;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.done = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.priority = const Value.absent(),
    this.deadlineDate = const Value.absent(),
    this.deadlineTime = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String projectId,
    required bool done,
    required String title,
    required String description,
    required int priority,
    this.deadlineDate = const Value.absent(),
    this.deadlineTime = const Value.absent(),
  })  : id = Value(id),
        projectId = Value(projectId),
        done = Value(done),
        title = Value(title),
        description = Value(description),
        priority = Value(priority);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<bool>? done,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? priority,
    Expression<DateTime>? deadlineDate,
    Expression<DateTime>? deadlineTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (done != null) 'done': done,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (priority != null) 'priority': priority,
      if (deadlineDate != null) 'deadline_date': deadlineDate,
      if (deadlineTime != null) 'deadline_time': deadlineTime,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? projectId,
      Value<bool>? done,
      Value<String>? title,
      Value<String>? description,
      Value<int>? priority,
      Value<DateTime?>? deadlineDate,
      Value<DateTime?>? deadlineTime}) {
    return TasksCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      done: done ?? this.done,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      deadlineDate: deadlineDate ?? this.deadlineDate,
      deadlineTime: deadlineTime ?? this.deadlineTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (deadlineDate.present) {
      map['deadline_date'] = Variable<DateTime>(deadlineDate.value);
    }
    if (deadlineTime.present) {
      map['deadline_time'] = Variable<DateTime>(deadlineTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('done: $done, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('deadlineTime: $deadlineTime')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done =
      GeneratedColumn<bool>('done', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("done" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deadlineDateMeta =
      const VerificationMeta('deadlineDate');
  @override
  late final GeneratedColumn<DateTime> deadlineDate = GeneratedColumn<DateTime>(
      'deadline_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deadlineTimeMeta =
      const VerificationMeta('deadlineTime');
  @override
  late final GeneratedColumn<DateTime> deadlineTime = GeneratedColumn<DateTime>(
      'deadline_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        done,
        title,
        description,
        priority,
        deadlineDate,
        deadlineTime
      ];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    } else if (isInserting) {
      context.missing(_doneMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('deadline_date')) {
      context.handle(
          _deadlineDateMeta,
          deadlineDate.isAcceptableOrUnknown(
              data['deadline_date']!, _deadlineDateMeta));
    }
    if (data.containsKey('deadline_time')) {
      context.handle(
          _deadlineTimeMeta,
          deadlineTime.isAcceptableOrUnknown(
              data['deadline_time']!, _deadlineTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      deadlineDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline_date']),
      deadlineTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline_time']),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final String id;
  final String title;
  const Project({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Project copyWith({String? id, String? title}) => Project(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project && other.id == this.id && other.title == this.title);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> id;
  final Value<String> title;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String title,
  })  : id = Value(id),
        title = Value(title);
  static Insertable<Project> custom({
    Expression<String>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  ProjectsCompanion copyWith({Value<String>? id, Value<String>? title}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'projects';
  @override
  String get actualTableName => 'projects';
  @override
  VerificationContext validateIntegrity(Insertable<Project> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TasksTable tasks = $TasksTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks, projects];
}
