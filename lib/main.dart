import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todolist.dart';
import 'package:todo_app/util/dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /*List<Todo> todos = List<Todo>();
    DbHelper helper = DbHelper();
    helper.initializeDb().then(
      (result) => helper.getTodos().then((result) => todos=result));
    
    DateTime today = DateTime.now();
    Todo todo = Todo("Comprar Naranjas", 3, today.toString(), "Ir al Super Mercado");
    helper.insertTodo(todo);*/


    return MaterialApp(
      title: 'Tarea APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tarea APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoList(),
    );
  }
}
