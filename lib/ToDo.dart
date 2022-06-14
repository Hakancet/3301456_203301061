import 'package:flutter/material.dart';
import 'data/todo_services.dart';
import 'models/todo.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPage createState() => _TodoPage();
}


class _TodoPage extends State<TodoPage> {

  TodoService todoService = TodoService.instance;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        labelText: 'NOT ADI',
        hintText: 'NOT BAŞLIĞI',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final descriptionField = TextFormField(
      controller: descController,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: 'AÇIKLAMA',
        hintText: 'KONUSU',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    final saveButton = FlatButton(
      onPressed: () {
        todoService
            .addTodo(Todo(
            id: null,
            title: titleController.text,
            description: descController.text,
            isDone: true))
            .then((value) => Navigator.pop(context));
      },
      child: const Text(
        "KAYDET",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("NOT EKLE "),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: titleField,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: descriptionField,
          ),
          saveButton,
        ],
      ),
    );
  }
}