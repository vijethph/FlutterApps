import 'round_icon_button.dart';

import 'bottom_button.dart';
import 'results_page.dart';

import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'constants.dart';
import 'calculator_brain.dart';

// enums look like this: enum EnumName {typeA, typeB, typeC} and called using EnumName.typeA
// enums can't be created inside classes
// private variables of a class begin with underscore _
// functions have a type, and they can be passed around, and can also be set as the value of a variable or a constant. functions are declared as: Function functionName = (int a, int b){ return a+b; };
// and called as result = functionName(5,8);
// functions can also be passed as params: int doSomething(int a, int b, Function doAction){ return doAction(a,b) };
// where it can be any simple function. invoked as: int res = doSomething(5,6,add); -> just name of function

// named routes: initialRoute : '/' - same as home: someScreen(). only one of them can exist at a time
// routes are defined in main.dart.
// routes {  '/': (context) => Screen0(),  '/first':(context) => Screen1(), '/second':(context) => Screen2()   }
// to use these routes, Navigator.pushNamed(context, '/first').  to come back: Navigator.pop(context);

// maps in dart: Map<KeyType, ValueType> mapName = { Key1:Value1, Key2:Value2 };
// call them as mapName[key1];

// in _inputpagestate:
// Color maleCardColour = inactiveCardColor;
// Color femaleCardColour = inactiveCardColor;
// // 1- male, 2- female
// void updateColour(Gender selectedGender) {
//   // male card pressed
//   if (selectedGender == Gender.male) {
//     if (maleCardColour == inactiveCardColor) {
//       maleCardColour = activeCardColor;
//       femaleCardColour = inactiveCardColor;
//     } else {
//       maleCardColour = inactiveCardColor;
//     }
//   }
//   // female card pressed
//   else if (selectedGender == Gender.female) {
//     if (femaleCardColour == inactiveCardColor) {
//       femaleCardColour = activeCardColor;
//       maleCardColour = inactiveCardColor;
//     } else {
//       femaleCardColour = inactiveCardColor;
//     }
//   }
// }

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int userHeight = 180;
  int userWeight = 60;
  int userAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          backgroundColor: Color(0xff03045e),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      changeActiveState: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      changeActiveState: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            userHeight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        // context is current state of app. copywith provides a way to get all default values and properties, and change only those that matter
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFF9e2a2b),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: userHeight.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newHeight) {
                            setState(() {
                              userHeight = newHeight.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            userWeight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    userWeight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    userWeight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            userAge.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    userAge--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    userAge++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: userHeight, weight: userWeight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
                buttonTitle: 'CALCULATE'),
          ],
        ));
  }
}
