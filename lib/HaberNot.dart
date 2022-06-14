import 'package:flutter/material.dart';
import 'package:mobil/ToDo.dart';
import 'data/todo_services.dart';
import 'models/todo.dart';

class Not extends StatefulWidget {
  @override
  _NotState createState() => _NotState();
}

class _NotState extends State<Not> {


  TodoService service = TodoService.instance;
  List<Todo> todos = [];
  List<Todo> doneTodos = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("HABER NOT EKLE "),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => TodoPage()))
              .then((value) => loadData());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getTodoList(List<Todo> todos) {
    return todos.isEmpty
        ? const Center(child: Text('BURASI BOŞ'))
        : ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(todos[index].title.toString()),
            subtitle: Text(todos[index].description.toString()),
          ),
        );
      },
    );
  }

  loadData() {
    service.getTodos(true).then((value) {
      setState(() {
        todos = value;
      });
    });
    service.getTodos(false).then((value) {
      setState(() {
        doneTodos = value;
      });
    });
  }
}



