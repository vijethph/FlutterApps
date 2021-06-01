import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// build method gets called on any change made to this widget
// container is similar to a div, its just a layout box
// containers with no children try to be as big as possible
// containers with children size themselves to their children
// SafeArea is area visible to user (not bounded by notches etc)
// EdgeInsets is spacing for edges
// columns automatically take up as much space as possible
// to change this, use mainAxisSize: MainAxisSize.min
// to lay out children bottom to top, verticalDirection : .down
// align children along something, mainAxisAlignment: .end
// align children along the opposite axis
// width: double.infinity - infinite width widget
// Sizedbox just gives little bit of spacing between important widgets
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue[900],
          appBar: AppBar(
            backgroundColor: Colors.yellow[900],
            title: Text('Personal Profile'),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/flash.png'),
                ),
                Text(
                  'Bruce Wayne',
                  style: TextStyle(
                    fontFamily: 'Calistoga',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'BILLIONAIRE BACHELOR',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    color: Colors.yellow.shade100,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.yellow.shade100,
                  ),
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.amber[900],
                      ),
                      title: Text(
                        '+98 449 566 9832',
                        style: TextStyle(
                          color: Colors.yellow.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    )
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.amber[900],
                      ),
                      title: Text(
                        'bruce@waynetech.com',
                        style: TextStyle(
                          color: Colors.yellow.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ));
  }
}
