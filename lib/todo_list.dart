import 'dart:io';

import '/modell.dart';
import "package:flutter/material.dart";

class TodoList extends StatelessWidget {
  final List<Modellen> listan;

  TodoList(this.listan);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listan.length,
      itemBuilder: (context, index) {
        return Platform.isAndroid
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      listan[index].titel,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      listan[index].kommentar,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      listan[index].date,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )




            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      listan[index].titel,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      listan[index].kommentar,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      listan[index].date,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
