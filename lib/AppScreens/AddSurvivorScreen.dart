import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Utils/appbar.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:trz/Utils/custom_text_field.dart';

import 'UserMainScreen.dart';

/*

  Functions:
  Add Survivor by add
  Save on shared preferences


 */

class AddSurvivorScreen extends StatefulWidget {
  static const routeName = '/addsurvivorscreen';

  @override
  State<StatefulWidget> createState() => new _AddSurvivorScreenState();

  AddSurvivorScreen();
}

class _AddSurvivorScreenState extends State<AddSurvivorScreen> {
  SharedPreferences prefs;
  final TextEditingController _addFieldController = new TextEditingController();
  CustomTextField _addField;


  @override
  void initState() {
    super.initState();


    _addField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _addFieldController,
      hint: "ID",
      //validator: Validator.validateAge,
      inputType: TextInputType.number,
    );

  }

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Survivor', _onBackPressed),
      body: Builder(
        builder: (BuildContext context){
          return buildContainer(context);
        },
      ),
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: Text(
                "Add a Survivor as a friend!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: _addField,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 15.0),
              child: RaisedButton(
                color: Colors.green[700],
                onPressed: () {
                  _setPrefs(_addFieldController.text);
                  _addFieldController.clear();
                  final snackBar = SnackBar(
                    content: Text('Success, survivor added!'),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: Text('Invite'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setPrefs(String uuid) async {
    String str;

    prefs = await SharedPreferences.getInstance();

    str = prefs.getString("contacts");

    if(str == null) {
      print("Add: $uuid");
      prefs.setString("contacts", uuid);
    }
    else {
      print("Add Concat: $str,$uuid");
      prefs.setString("contacts", "$str,$uuid");
    }
  }

}
