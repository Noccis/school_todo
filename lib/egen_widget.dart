import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  String? newText; // Can be null
  NewWidget({this.newText});
  @override
  Widget build(BuildContext context) {
    return Text(newText as String);
  }
}