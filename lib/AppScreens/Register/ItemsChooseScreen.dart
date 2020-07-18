import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trz/Classes/Items.dart';
import 'package:trz/Utils/add_button.dart';
import 'package:trz/Utils/sub_button.dart';

List<Items> itemData = [
  Items(name: 'Fiji Water', valueItem: 14, holdItems: 0),
  Items(name: 'Campbell Soup', valueItem: 12, holdItems: 0),
  Items(name: 'First Aid Pouch', valueItem: 10, holdItems: 0),
  Items(name: 'AK47', valueItem: 8, holdItems: 0),
];

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


  Widget _buildPlayerItems(BuildContext context){
    return ListView.builder(
      itemCount: itemData.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[

            if(index == 0)
              Text("Total Money: ${this.widget.totalMoney}"),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text("${itemData[index].name}"),
                Row(
                  children: <Widget>[
                    new InkWell(
                      child: SubButton(),
                      onTap: (){
                        print("sub btn click");
                      },
                    ),
                    new Container(
                      height: 35,
                      width: 90,
                      alignment: Alignment.center,
                      //margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      ),
                      child: Text("${itemData[index].holdItems}"),
                    ),
                    new InkWell(
                      child: AddButton(),
                      onTap: (){
                        print("add btn click");
                      },
                    ),
                  ],
                ),
              ],
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
