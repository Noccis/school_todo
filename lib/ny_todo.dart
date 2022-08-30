import "package:flutter/material.dart";

class NyTodo extends StatefulWidget {
  final Function addTodo;

  NyTodo(this.addTodo);

  @override
  State<NyTodo> createState() => _NyTodoState();
}

class _NyTodoState extends State<NyTodo> {
  final todoController = TextEditingController();
  final commentController = TextEditingController();
  final dateController = TextEditingController();

  void skickaTillbaka() {
    final todo = todoController.text;
    final comment = commentController.text;
    final date = dateController.text;

    widget.addTodo(todo, comment, date);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
            decoration: InputDecoration(labelText: "Titel"),
            controller: todoController),
        TextField(
          decoration: InputDecoration(labelText: "Kommentar"),
          controller: commentController,
        ),
        TextField(
          decoration: InputDecoration(labelText: "Datum"),
          controller: dateController,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ElevatedButton(
            onPressed: skickaTillbaka,
            child: Text("Bekräfta"),
          ),
        )
      ],
    );
  }
}