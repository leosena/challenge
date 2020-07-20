import 'package:flutter/material.dart';
import 'Register/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserMainScreen.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/rootscreen';
  Future<bool>  userExists;

  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  @override
  Widget build(BuildContext context) {

    //TODO verify user unique ID not working.
    /*
    if(_containsID() == null ) {
      print("new user");
      return new RegisterScreen();
    }
    else{
      print("existing user");
      return new UserMainScreen();
    }

     */
    return new RegisterScreen();

  }

  Future<String> _readPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("id");
  }

  Future<bool> _containsID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("id found:");
    print(prefs.getString("id"));
    return prefs.containsKey("id");
  }

}
