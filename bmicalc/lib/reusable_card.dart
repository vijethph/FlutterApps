

// stateless widgets are immutable. they can't be changed.
// whenever any change is made in a widget, old widget is destroyed and new widget is created, which takes up its place
// in Dart, const cannot be used at runtime, as they cannot be assigned value at runtime
// final can be used at runtime
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key key}) : super(key: key); // key is something to keep track of state of widgets moving, like in animation
  ReusableCard({@required this.colour, this.cardChild, this.changeActiveState}); // required param

  final Color colour;
  final Widget cardChild;
  final Function changeActiveState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeActiveState,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}