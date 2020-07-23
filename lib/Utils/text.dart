import 'package:flutter/material.dart';

Widget bigText (String title, Color c) {
  return Text(
    title,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: c,
    ),
  );
}


Widget mediumText (String title) {
  return Text(
    title,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );
}