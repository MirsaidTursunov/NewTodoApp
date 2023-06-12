import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao/tasks_dao.dart';
import 'entity/tasks.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Tasks])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get tasksDao;

  static late AppDatabase instance;

  static Future<void> init() async {
    instance =
        await $FloorAppDatabase.databaseBuilder('new_todo_app_database.db').build();
  }
}
