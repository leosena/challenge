import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Classes/Items.dart';

class AddSubButtonTrade extends StatefulWidget {
  int index;

  _AddSubButtonTradeState createState() => _AddSubButtonTradeState();
  AddSubButtonTrade({this.index});
}

class _AddSubButtonTradeState extends State<AddSubButtonTrade> {
  Color currentColor;

  void _add() {
    setState(() {
      itemData_register[this.widget.index].holdItems += 1;
    });
  }

  void _remove() {
    setState(() {
      if (itemData_register[this.widget.index].holdItems >= 1)
        itemData_register[this.widget.index].holdItems -= 1;
    });
  }

  int getValue(int idx) {
    return itemData_register[idx].holdItems;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        subWidget(context),
        resultWidget(context),
        addWidget(context),
      ],
    );
  }

  Widget addWidget(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        _add();

      },
      color: Colors.green[700],
      textColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 24,
      ),
      padding: EdgeInsets.all(5),
      shape: CircleBorder(),
    );
  }

  Widget subWidget(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        _remove();

      },
      color: Colors.green[700],
      textColor: Colors.white,
      child: Icon(
        Icons.remove,
        size: 24,
      ),
      padding: EdgeInsets.all(5),
      shape: CircleBorder(),
    );
  }

  Widget resultWidget(BuildContext context) {
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
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: new Text("${itemData_register[this.widget.index].holdItems}"),
    );
  }

}


