// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao? _tasksDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Tasks` (`nameTask` TEXT NOT NULL, `descriptionTask` TEXT NOT NULL, `locationTask` TEXT NOT NULL, `timeTask` TEXT NOT NULL, `colorTask` TEXT NOT NULL, PRIMARY KEY (`nameTask`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get tasksDao {
    return _tasksDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _tasksInsertionAdapter = InsertionAdapter(
            database,
            'Tasks',
            (Tasks item) => <String, Object?>{
                  'nameTask': item.nameTask,
                  'descriptionTask': item.descriptionTask,
                  'locationTask': item.locationTask,
                  'timeTask': item.timeTask,
                  'colorTask': item.colorTask
                },
            changeListener),
        _tasksUpdateAdapter = UpdateAdapter(
            database,
            'Tasks',
            ['nameTask'],
            (Tasks item) => <String, Object?>{
                  'nameTask': item.nameTask,
                  'descriptionTask': item.descriptionTask,
                  'locationTask': item.locationTask,
                  'timeTask': item.timeTask,
                  'colorTask': item.colorTask
                },
            changeListener),
        _tasksDeletionAdapter = DeletionAdapter(
            database,
            'Tasks',
            ['nameTask'],
            (Tasks item) => <String, Object?>{
                  'nameTask': item.nameTask,
                  'descriptionTask': item.descriptionTask,
                  'locationTask': item.locationTask,
                  'timeTask': item.timeTask,
                  'colorTask': item.colorTask
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Tasks> _tasksInsertionAdapter;

  final UpdateAdapter<Tasks> _tasksUpdateAdapter;

  final DeletionAdapter<Tasks> _tasksDeletionAdapter;

  @override
  Stream<List<Tasks>> getBasketTasks() {
    return _queryAdapter.queryListStream('SELECT * FROM Tasks',
        mapper: (Map<String, Object?> row) => Tasks(
            nameTask: row['nameTask'] as String,
            descriptionTask: row['descriptionTask'] as String,
            locationTask: row['locationTask'] as String,
            timeTask: row['timeTask'] as String,
            colorTask: row['colorTask'] as String),
        queryableName: 'Tasks',
        isView: false);
  }

  @override
  Stream<List<Tasks>> getBasketTasksAsync() {
    return _queryAdapter.queryListStream('SELECT * FROM Tasks',
        mapper: (Map<String, Object?> row) => Tasks(
            nameTask: row['nameTask'] as String,
            descriptionTask: row['descriptionTask'] as String,
            locationTask: row['locationTask'] as String,
            timeTask: row['timeTask'] as String,
            colorTask: row['colorTask'] as String),
        queryableName: 'Tasks',
        isView: false);
  }

  @override
  Future<void> insertTasks(Tasks tasks) async {
    await _tasksInsertionAdapter.insert(tasks, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTasks(Tasks tasks) async {
    await _tasksUpdateAdapter.update(tasks, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeTasks(Tasks tasks) async {
    await _tasksDeletionAdapter.delete(tasks);
  }

  @override
  Future<void> removeAll(List<Tasks> tasks) async {
    await _tasksDeletionAdapter.deleteList(tasks);
  }
}
