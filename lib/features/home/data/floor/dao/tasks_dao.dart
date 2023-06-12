import 'package:floor/floor.dart';
import 'package:new_todo_app/features/home/data/floor/entity/tasks.dart';

@dao
abstract class TaskDao{
  @Query('SELECT * FROM Tasks')
  Stream<List<Tasks>> getBasketTasks();

  @Query('SELECT * FROM Tasks')
  Stream<List<Tasks>> getBasketTasksAsync();

  @insert
  Future<void> insertTasks(Tasks tasks);

  @delete
  Future<void>removeTasks(Tasks tasks);

  @update
  Future<void> updateTasks(Tasks tasks);

  @delete
  Future<void> removeAll(List<Tasks> tasks);

}