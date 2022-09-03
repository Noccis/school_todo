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
        return Platform.isIOS
            ? Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          listan[index].titel,
                          style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          listan[index].kommentar,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontStyle: FontStyle.italic),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            listan[index].date,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      listan[index].titel,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                    Text(
                      listan[index].kommentar,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        listan[index].date,
                        style: TextStyle(
                            fontSize: 12, 
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
