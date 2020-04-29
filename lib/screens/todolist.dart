import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if(todos == null ){
      todos = List<Todo>();
      getData();
    }
    return Scaffold(

      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "Add new Todo",
        child: Icon(Icons.add),
      ),
      
    );
  }


  void getData(){
    final dbFuture = helper.initializeDb();
    dbFuture.then((result){
      final todoFuture = helper.getTodos();
      todoFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;
        for (int i; i<count; i++){
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }

        setState(() {
          todos = todoList;
          count = count;
        });

        debugPrint("Items " + count.toString());
      });
    });
  }
}