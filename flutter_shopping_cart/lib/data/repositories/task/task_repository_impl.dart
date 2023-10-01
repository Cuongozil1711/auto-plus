import 'package:flutter_shopping_cart/data/repositories/task/task_datasource.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_repository.dart';
import 'package:flutter_shopping_cart/data/model/task.dart';

class TaskRepositoryImpl implements Repository<Task> {
  final TaskDatasource _datasource;
  TaskRepositoryImpl(this._datasource);

  @override
  Future<void> add(Task task) async {
    try {
      print(12);
      await _datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> delete(Task task) async {
    try {
      await _datasource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAll() async {
    try {
      print(30);
      return await _datasource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> update(Task task) async {
    try {
      await _datasource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}
