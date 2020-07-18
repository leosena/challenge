import 'package:flutter/material.dart';

class ItemsContainerQty extends StatefulWidget {
  int value;

  _ItemsContainerQtyState createState() => _ItemsContainerQtyState();
  ItemsContainerQty({this.value});
}

class _ItemsContainerQtyState extends State<ItemsContainerQty> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: new Text("${this.widget.value}"),
    );
  }
}