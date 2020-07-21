import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'RootScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    return new SplashScreen(
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[400],
            Colors.indigo[500],
            Colors.indigo[400],
            Colors.indigo[300],
          ],
        ),

        seconds: 2,
        navigateAfterSeconds: new RootScreen(),

        image: new Image.asset(
          'assets/images/survivors.jpg',
          fit: BoxFit.fill,
        ),

        //backgroundColor: Colors.orange,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.white
    );

  }

}

