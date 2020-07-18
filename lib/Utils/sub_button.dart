
import 'package:flutter/material.dart';
import 'package:trz/AppScreens/Register/ItemsChooseScreen.dart';
import 'package:trz/Classes/Items.dart';

class SubButton extends StatefulWidget {
  int value,
      index;

  _SubButtonState createState() => _SubButtonState();
  SubButton({this.value, this.index});
}

class _SubButtonState extends State<SubButton> {
  Color currentColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        print("sub btn click2: ${this.widget.value} , index: ${this.widget.index}");
      },
      color: Colors.blue,
      textColor: Colors.white,
      child: Icon(
        Icons.remove,
        size: 24,
      ),
      padding: EdgeInsets.all(5),
      shape: CircleBorder(),
    );
  }
}