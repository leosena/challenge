import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trz/AppScreens/UserMainScreen.dart';
import 'package:trz/Classes/Items.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:trz/Utils/add_sub_button.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' ;
import 'package:http/http.dart' as http;


class ItemsChooseScreen extends StatefulWidget {
  final String name, age, gender;
  Position currentPosition;

  int totalMoney;


  ItemsChooseScreen({this.name, this.age, this.gender});

  @override
  State<StatefulWidget> createState() => new _ItemsChooseScreenState();
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
    _getCurrentLocation();


    this.widget.totalMoney = 100;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildPlayerItems(context),
    );
  }


  Widget _buildPlayerItems(BuildContext context) {

    List<AddSubButton> listButtons = new List<AddSubButton>();


    return ListView.builder(
      itemCount: itemData.length,
      itemBuilder: (context, index) {
        AddSubButton btn = new AddSubButton(index: index);
        listButtons.add(btn);
        return Column(
          children: <Widget>[

            if (index == 0)
              Text("Total Money: ${this.widget.totalMoney}"),
              Padding(padding: EdgeInsets.only(bottom: 15.0, top: 5.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text("${itemData[index].name}"),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 5.0),
                ),
                Container(

                  child: btn,
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
                  onPressed: () async {
                    saveUniqueID("teste").then((bool commited){

                    });

                    String finalItems = "";
                    for(int i = 0; i < listButtons.length; i++){
                      finalItems += "${itemData[i].name}:${itemData[i].holdItems};";
                    }
                    //Survivor surv = await createSurvivorPost(this.widget.name, this.widget.age, this.widget.gender, finalItems);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                UserMainScreen()),
                            (Route<dynamic> route) => false);

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
