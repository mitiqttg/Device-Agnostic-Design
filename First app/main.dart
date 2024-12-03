import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My application"),
        ),
        body: Center(
          child: Text("Hello world!"),
        ),
      ),
    ),
  );
}