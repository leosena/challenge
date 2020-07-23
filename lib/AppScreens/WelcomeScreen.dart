import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'RootScreen.dart';

class WelcomeScreen extends StatefulWidget {
  SharedPreferences prefs;

  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
  WelcomeScreen({this.prefs});
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
            Colors.green[400],
            Colors.white,
            Colors.green[400],
            Colors.green[500],
          ],
        ),
        seconds: 2,
        navigateAfterSeconds: new RootScreen(prefs: this.widget.prefs),
        image: new Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.fill,
        ),

        //backgroundColor: Colors.orange,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
