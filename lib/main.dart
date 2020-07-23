import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppScreens/AddSurvivorScreen.dart';
import 'AppScreens/FriendListScreen.dart';
import 'AppScreens/TradeItemsScreen.dart';
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
      routes: <String, WidgetBuilder>{
        AddSurvivorScreen.routeName: (BuildContext context) => new AddSurvivorScreen(),
        FriendListScreen.routeName: (BuildContext context) => new FriendListScreen(),
        TradeItemsScreen.routeName: (BuildContext context) => new TradeItemsScreen(),

      },
    );
  }

  Widget _handleCurrentScreen() {
    return new WelcomeScreen(prefs: this.prefs);
  }
}