import 'package:flutter/material.dart';
import 'package:trz/Classes/Items.dart';

class AddSubButton extends StatefulWidget {
  int index;

  _AddSubButtonState createState() => _AddSubButtonState();
  AddSubButton({this.index});

}

class _AddSubButtonState extends State<AddSubButton> {
  Color currentColor;

  void _add(){
    setState(() {
      itemData[this.widget.index].holdItems += 1;
    });
  }

  void _remove(){
    setState(() {
      if(itemData[this.widget.index].holdItems >= 1)
        itemData[this.widget.index].holdItems -= 1;
    });

  }

  int getValue(int idx){
    return itemData[idx].holdItems;
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

  Widget addWidget (BuildContext context) {
    return MaterialButton(
      onPressed: () {
        _add();
        print("${itemData[this.widget.index].holdItems}");
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

  Widget subWidget (BuildContext context) {
    return MaterialButton(
      onPressed: () {
        _remove();
        print("${itemData[this.widget.index].holdItems}");
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

  Widget resultWidget (BuildContext context){
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
      child: new Text("${itemData[this.widget.index].holdItems}"),
    );

  }
}
