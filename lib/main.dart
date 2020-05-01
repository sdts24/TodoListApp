	import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todolist.dart';
import 'package:todo_app/util/dbhelper.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

    List<Todo> todos = List<Todo>();
    DbHelper helper = DbHelper();
    
  @override
  Widget build(BuildContext context) {
    helper.initializeDb().then(
                   (result) => helper.getTodos().then((result) => todos=result));
    
    DateTime today = DateTime.now();
    Todo todo = Todo("Comprar Naranjas", 3, today.toString(), "Ir al Super Mercado");
    helper.insertTodo(todo);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: todo.title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: TodoList(),
      ),
    );
  }
}