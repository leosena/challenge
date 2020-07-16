import 'package:flutter/material.dart';
import 'package:trz/AppScreens/RegisterScreen.dart';

import 'UserMainScreen.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/rootscreen';

  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {

    //TODO verificar usuario ja cadastrado.
    return new RegisterScreen();
    //return new UserMainScreen();
  }
}
