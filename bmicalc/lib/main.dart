import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(
            0xff264653), // appBar color and others, format: argb, 0xff is fully opaque
        // accentColor: Colors.purple, // floating action button color and others
        scaffoldBackgroundColor: Color(0xFF264653),
        // textTheme: TextTheme(body1: TextStyle(color: Colors.white),),
      ),
      home: InputPage(),
    );
  }
}


