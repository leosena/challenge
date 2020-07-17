import 'package:flutter/material.dart';



class ItemsChooseScreen extends StatefulWidget {
  final String name,
               age,
               gender;

  double posX,
         posY;

  ItemsChooseScreen({this.name, this.age, this.gender, this.posX, this.posY});

  @override
  State<StatefulWidget> createState() => new _ItemsChooseScreenState();
}

class _ItemsChooseScreenState extends State<ItemsChooseScreen> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

/*
      if (this.widget.posX != null && this.widget.posY != null)
                Text(
                    "LAT: ${this.widget.posX}, LNG: ${this.widget.posY}"),


 */

}
