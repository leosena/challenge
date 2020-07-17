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

    print("LAT: ${this.widget.posX}, LNG: ${this.widget.posY}");
    print("nome: ${this.widget.name}, age: ${this.widget.age}, gender: ${this.widget.gender}");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (this.widget.posX != null && this.widget.posY != null)
              Text(
                  "LAT: ${this.widget.posX}, LNG: ${this.widget.posY}"),

          ],
        ),
      ),
    );
  }

}
