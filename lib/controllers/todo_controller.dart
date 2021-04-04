import 'package:get/get.dart';
import 'package:todo_getx/models/todo.dart';

class TodoController extends GetxController {
  List<Todo> _todos;
  List<Todo> get todos => _todos;

  TodoController() {
    _todos = [];
  }

  addTodo(Todo todo) {
    _todos.add(todo);
    update();
  }

  deleteTodo(String id) {
    _todos.removeWhere((element) => element.id == id);
    update();
  }

  changeStatus(Todo todo) {
    int index = _todos.indexOf(todo);
    _todos[index].isCompleted = !_todos[index].isCompleted;
    update();
  }

  updateTodo(Todo oldTodo, String newDescription) {
    int index = _todos.indexOf(oldTodo);
    _todos[index].description = newDescription;
    update();
  }
}
