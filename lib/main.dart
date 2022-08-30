import "package:flutter/material.dart";
import "modell.dart";
import "ny_todo.dart";
import 'todo_list.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: "It Högskolan Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Modellen> helaTodoListan = [];

  void startTodo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => GestureDetector(
              child: NyTodo(adderaNyTodo),
            ));
  }

  void adderaNyTodo(String titel, String kommentar, String date) {
    final newToDo = Modellen(titel, kommentar, date);
    setState(() {
      helaTodoListan.add(newToDo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            // För android endast
            appBar: AppBar(
              title: Text("To do app"),
            ),
            body: helaTodoListan.isEmpty
                ? Center(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 300),
                      child: Column(
                        children: [
                          Text(
                            'Listan är tom',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    )),
                  )
                : Center(
                    child: TodoList(helaTodoListan),
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => startTodo(context),
              child: Icon(Icons.add),
            ),
          )
        : CupertinoPageScaffold(
            // För IOS endast
            child: helaTodoListan.isEmpty
                ? Center(
                    child: Text(
                      'Listan är tom!',
                      style: TextStyle(
                          color: Colors.black, 
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                : Center(
                    child: TodoList(helaTodoListan),
                  ),
            navigationBar: CupertinoNavigationBar(
              middle: Text('Todo app'),
              backgroundColor: Colors.green,
              trailing: GestureDetector(
                onTap: () => startTodo(context),
                child: (Icon(Icons.add)),
              ),
            ),
          );
  }
}
