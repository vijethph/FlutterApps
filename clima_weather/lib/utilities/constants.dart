import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Roboto Slab',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Roboto Slab',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Roboto Slab',
  color: Colors.lime
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.input_rounded,
    color: Colors.amber,
    size: 35.0,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.blueGrey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
