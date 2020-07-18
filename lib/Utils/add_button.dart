import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  Color currentColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {

      },
      color: Colors.blue,
      textColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 24,
      ),
      padding: EdgeInsets.all(5),
      shape: CircleBorder(),
    );
  }
}
