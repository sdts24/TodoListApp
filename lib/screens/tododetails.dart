import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:intl/intl.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  TodoDetail(this.todo);

  @override
  TodoDetailState createState() => TodoDetailState(todo);
}

class TodoDetailState extends State<TodoDetail> {
  Todo todo;
  TodoDetailState(this.todo);

  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(todo.title),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                _textTitleField(textStyle),
                _textDescriptionField(textStyle),
                _dropDownButton(textStyle)
              ],
            ),
          ],
        ));
  }

//Text Field para el Titulo
  Widget _textTitleField(TextStyle textStyle) {
    return TextField(
      controller: titleController,
      style: textStyle,
      decoration: InputDecoration(
        labelText: 'Title',
        labelStyle: textStyle,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

//Text Field para la description
  Widget _textDescriptionField(TextStyle textStyle) {
    return TextField(
      controller: descriptionController,
      style: textStyle,
      decoration: InputDecoration(
        labelText: 'Description',
        labelStyle: textStyle,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  Widget _dropDownButton(TextStyle textStyle) {
    return DropdownButton<String>(
      items: _priorities.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      style: textStyle,
      value: "Low",
      onChanged: null,
    );
  }
}
