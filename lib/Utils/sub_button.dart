
import 'package:flutter/material.dart';

class SubButton extends StatefulWidget {
  _SubButtonState createState() => _SubButtonState();
}

class _SubButtonState extends State<SubButton> {
  Color currentColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {

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