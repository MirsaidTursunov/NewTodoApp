import 'package:new_todo_app/features/home/data/floor/app_database.dart';
import 'package:new_todo_app/features/home/data/floor/dao/tasks_dao.dart';
import 'package:new_todo_app/features/home/data/floor/entity/tasks.dart';

class LocalSource {
  final TaskDao _taskDao = AppDatabase.instance.tasksDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  Stream<List<Tasks>> getTasks() {
    return _taskDao.getBasketTasks();
  }

  Stream<List<Tasks>> getTasksAsync() {
    return _taskDao.getBasketTasksAsync();
  }

  Future<void> insertTask(Tasks tasks) async {
    await _taskDao.insertTasks(tasks);
  }

  Future<void> removeTask(Tasks tasks) async {
    await _taskDao.removeTasks(tasks);
  }

  Future<void> updateTask(Tasks tasks) async {
    await _taskDao.updateTasks(tasks);
  }

  Future<void> removeAll(List<Tasks> tasks) async {
    await _taskDao.removeAll(tasks);
  }
}
