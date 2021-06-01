import 'package:flutter/material.dart';

// main() is the starting point
// scaffold is the body part, appbar is like navbar
// image:NetworkImage( expects a url of img in single quotes) displays image from internet
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Center(
            child: Text('I am Super Rich'),
          ),
          backgroundColor: Colors.orange[800],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.jpg'),
          ),
        ),
      ),
    ),
  );
}