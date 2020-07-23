import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/AppScreens/UserMainScreen.dart';
import 'package:trz/Classes/Items.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:trz/Utils/add_sub_button.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'dart:convert' ;
import 'package:http/http.dart' as http;
import 'file:///C:/Users/lscunha/AndroidStudioProjects/Project/challenge/lib/Services/Http.dart';


class TradeItemsScreen extends StatefulWidget {
  static const routeName = '/tradeitemscreen';

  @override
  State<StatefulWidget> createState() => new _TradeItemsScreenState();
}


class _TradeItemsScreenState extends State<TradeItemsScreen> {
  SharedPreferences prefs;


  int totalMoneyP1,
      totalMoneyP2;

  String id;

  @override
  void initState() {
    totalMoneyP1 = 0;
    totalMoneyP2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildPlayerItems(context),
    );
  }


  Widget _buildPlayerItems(BuildContext context) {

    List<AddSubButton> listButtons = new List<AddSubButton>();


    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[


        ],
      ),
    );
  }
}
