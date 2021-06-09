import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// with - provides class ability to act as a single ticker provider
// for multiple tickers - use TickerProviderStateMixin
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this, // specifies ticker provider - thing that can act as ticker
      // in this case, the object created from _WelcomeScreenState acts as ticker
      //upperBound: 100.0,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // for curved animations, upperbound can't be greater than 1

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    // tween animations incrementally change by a small value to give a smooth transition
    // tween / in-between. similar examples: borderradiustween, alignmenttween
    // all these take a begin value and end value, and animate it

    controller.forward(); // start with the animation

    // controller.reverse(from: 1.0); // reverse the animation from 1 to 0

    // animation.addStatusListener((status) {
    //   // for forward animation - after it completes, status shows completed
    //   // for reverse animations, it shows dismissed
    //   // print(status);
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //   // this animation loops forever, costing resources even if we navigate to some other screen
    //   // its necessary to dispose it when we navigate to other screen
    // });

    controller.addListener(() {
      //print(controller.value); // the value changes from 0 to 1
      // this controller.value can be applied to any widget property, like color, text etc..
      print(animation.value);
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  // Go to login screen.
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () {
                  // Go to registration screen.
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}

// 3 ingredients required for implementing a hero animation:
// 1. atleast 2 or more hero widgets -  one on starting screen and another on ending screen
// 2. a shared tag property - having same value on both widgets
// 3. navigator-based screen transitions

// animations in flutter require 3 things:
// 1. a ticker - something that tick and take the animation along at each tick of the clock
// every time a ticker ticks, it triggers a new setState to render something different on screen
// 2. animation controller
// 3. an animation-value - thing which actually does the animation. varies from 0 to 1 usually

