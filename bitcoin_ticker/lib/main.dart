import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCoin Ticker',
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.white54),
      home: PriceScreen(),
    );
  }
}
