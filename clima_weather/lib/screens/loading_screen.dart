import 'package:clima_weather/services/networking.dart';
import 'package:clima_weather/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_weather/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// lifecycle methods for stateful widgets:
// initstate - gets triggered when widgets are initialized. gets called only once - during object creation
// build - gets triggered when widgets are actually built and show up on screen. gets called many times
// deactivate - gets triggered when widgets get destroyed

// Future is an object which gets data after a period of time
// marking a function async await means, tasks after an async function take place after it, as though it depends on it, instead of finishing early
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.yellow,
          size: 100.0,
        ),
      ),
    );
  }
}
