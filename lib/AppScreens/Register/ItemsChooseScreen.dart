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
import 'package:trz/Utils/post_get_api.dart';


class ItemsChooseScreen extends StatefulWidget {
  final String name,
               age,
               gender,
               uuid;

  Position currentPosition;
  int totalMoney;

  SharedPreferences prefs;

  ItemsChooseScreen({this.name, this.age, this.gender, this.currentPosition, this.uuid, this.prefs});

  @override
  State<StatefulWidget> createState() => new _ItemsChooseScreenState();
}


class _ItemsChooseScreenState extends State<ItemsChooseScreen> {

  String id;

  @override
  void initState() {
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

                    String finalItems = "";
                    for(int i = 0; i < listButtons.length; i++){
                      finalItems += "${itemData[i].name}:${itemData[i].holdItems};";
                    }

                    Survivor surv = await createSurvivorPost(this.widget.name, this.widget.age, this.widget.gender, this.widget.currentPosition.latitude.toString(), this.widget.currentPosition.longitude.toString(), finalItems);
                    _setPrefs(surv.id);


                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                UserMainScreen(currentPosition: this.widget.currentPosition, uuid: this.widget.uuid, prefs: this.widget.prefs, lastScreen: "register",)),
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

  Future<void> _setPrefs(String uuid) async {
    this.widget.prefs = await SharedPreferences.getInstance();
    this.widget.prefs.setString("id", uuid);
  }

}
