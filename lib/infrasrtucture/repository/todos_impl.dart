import 'package:hive/hive.dart';

import 'package:to_do_app/domain/models/todo_model.dart';

import 'package:to_do_app/domain/repository/todos.dart';

class TodosRepositoryImpl extends TodosRepository {
  final myBox = Hive.box<ToDo>('mybox');
  final String path = 'todos';

  @override
  Future<List<ToDo>> loadTodos() async {
    final tasks = myBox.values.toList();
    return tasks;
  }

  @override
  Future<void> saveTodo(ToDo toDo) async {
    myBox.put(toDo.id, toDo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    myBox.delete(id);
  }

  @override
  Future<void> editTask(ToDo toDo) async {
    await myBox.put(toDo.id, toDo);
  }
}
