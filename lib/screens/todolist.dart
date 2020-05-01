import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/tododetails.dart';
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
        onPressed: (){
          navigateToDetail(Todo("",3,""));
        },
        tooltip: "Add new Todo",
        child: Icon(Icons.add),
      ),
      
    );
  }

  Widget todoListItems(){

    return ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext context, int position){
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(this.todos[position].id.toString()),
                  ),
                  title:Text(this.todos[position].title), 
                  subtitle: Text(this.todos[position].date),
                  onTap: (){
                    debugPrint("Hizo click en " + this.todos[position].id.toString());
                    navigateToDetail(this.todos[position]);
                  },
                ),
              );
        },
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

//Metodo para navegar de una pagina a otra...

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(context, 
      MaterialPageRoute(builder: (context) => TodoDetail(todo)),
    );
  }
  
}