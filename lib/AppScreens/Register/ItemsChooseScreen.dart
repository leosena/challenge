import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trz/Classes/Items.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:trz/Utils/add_sub_button.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' ;

class ItemsChooseScreen extends StatefulWidget {
  final String name, age, gender;

  int totalMoney;

  Position currentPosition;

  ItemsChooseScreen({this.name, this.age, this.gender});

  @override
  State<StatefulWidget> createState() => new _ItemsChooseScreenState();
}

Future<Survivor> createSurvivor(String name, String age, String gender, String items) async {
    final String apiUrl = "http://zssn-backend-example.herokuapp.com/api/people.json";
    final response = await http.post(apiUrl, body: {
      "name": name,
      "age": age,
      "gender": gender,
      "items": items,
    });

    if(response.statusCode == 201){
      final String responseString = response.body;
      return Survivor.fromJson(responseString);
    }else{
      return null;
    }
}

class _ItemsChooseScreenState extends State<ItemsChooseScreen> {
  SharedPreferences _preferences;

  String id;

  @override
  void initState() {
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._preferences = prefs);
      });

    this.widget.totalMoney = 100;
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildPlayerItems(context),
    );
  }


  Widget _buildPlayerItems(BuildContext context) {
    return ListView.builder(
      itemCount: itemData.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            if (index == 0)
              Text("Total Money: ${this.widget.totalMoney}"),
              Padding(padding: EdgeInsets.only(bottom: 15.0, top: 5.0)),

            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text("${itemData[index].name}"),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 5.0),
                ),
                Container(
                  child: AddSubButton(index: index),
                  alignment: Alignment.center,
                ),
              ],
            ),
            if (index == 3)
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: CustomFlatButton(
                  title: "Create Survivor",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  onPressed: () {
                    saveUniqueID("teste").then((bool commited){
                      print("${this.widget.currentPosition.latitude}  ${this.widget.currentPosition.longitude}");
                    });
                  },
                  splashColor: Colors.black12,
                  borderColor: Colors.indigoAccent,
                  borderWidth: 0,
                  color: Colors.indigoAccent,
                ),
              ),
          ],
        );
      },
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        this.widget.currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<bool> saveUniqueID(String id) async {
    this._preferences.setString("id", id);
  }

}
