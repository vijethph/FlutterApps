import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dice States',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            title: Text('Diced'),
            backgroundColor: Colors.purple,
          ),
          body: DicePage(),
        ));
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeLeftDiceNumber(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // range from 1 to 6
    });
  }

  void changeRightDiceNumber(){
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1; // range from 1 to 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            // expanded widget takes as much space as its parent or container. its expansion factor can be specified with flex. flex should only be specified with two or more widgets
            child: TextButton(
              child: Image.asset(
                  'images/dice$leftDiceNumber.png'), // does the same thing as below)
              onPressed: () {
                changeLeftDiceNumber();
                print(
                    'left button got pressed. number changed to $leftDiceNumber');
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
              onPressed: () {
                changeRightDiceNumber();
                print(
                    'right button got pressed. number changed to $rightDiceNumber');
              },
            ),
          ),
        ],
      ),
    );
  }
}
