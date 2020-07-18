import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trz/Classes/Items.dart';
import 'package:trz/Utils/add_sub_button.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:trz/Utils/sub_button.dart';


class ItemsChooseScreen extends StatefulWidget {
  final String name, age, gender;

  int totalMoney;

  Position currentPosition;

  ItemsChooseScreen({this.name, this.age, this.gender});

  @override
  State<StatefulWidget> createState() => new _ItemsChooseScreenState();
}

class _ItemsChooseScreenState extends State<ItemsChooseScreen> {
  @override
  void initState() {
    this.widget.totalMoney = 100;
    //_getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildPlayerItems(context),
    );
  }

  Widget _buildPlayerItems(BuildContext context) {
    AddSubButton a;
    return ListView.builder(
      itemCount: itemData.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            if (index == 0) Text("Total Money: ${this.widget.totalMoney}"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("${itemData[index].name}"),
                AddSubButton(index: index),

              ],
            ),
            if (index == 3)
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 40.0),
                child: CustomFlatButton(
                  title: "Create Survivor",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  onPressed: () {


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
}
