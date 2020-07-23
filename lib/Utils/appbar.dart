import 'package:flutter/material.dart';

Widget buildAppBar(String title, Function func) {
  if (func != null)
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.green[700],
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          func();
        },
      ),
    );
  else
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.green[700],

    );
}
