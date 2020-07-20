import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppScreens/WelcomeScreen.dart';

void main() async {
  runApp(MyApp());

  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
}


class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp({this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRZ',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.indigo,
        primarySwatch: Colors.indigo,
      ),
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    return new WelcomeScreen();
  }
}