import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo.dart';
import 'package:todo_getx/screens/widgets/todo_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todoControllerP = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: GetBuilder(
        builder: (TodoController todoController) {
          return ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  //TODO:to update todo
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return TodoForm(
                        type: "update",
                        todo: todoController.todos[index],
                      );
                    },
                  );
                },
                leading: Checkbox(
                  value: todoController.todos[index].isCompleted,
                  onChanged: (value) {
                    todoController.changeStatus(todoController.todos[index]);
                  },
                ),
                title: Text(
                  todoController.todos[index].description,
                ),
                trailing: IconButton(
                  onPressed: () {
                    todoController.deleteTodo(todoController.todos[index].id);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TodoForm(
                type: "new",
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
