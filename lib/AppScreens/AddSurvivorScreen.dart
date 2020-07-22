import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Utils/appbar.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:trz/Utils/custom_text_field.dart';

/*

  Functions:
  Add Survivor by add
  Save on shared preferences


 */

class AddSurvivorScreen extends StatefulWidget {
  static const routeName = '/addsurvivorscreen';
  SharedPreferences prefs;

  @override
  State<StatefulWidget> createState() => new _AddSurvivorScreenState();

  AddSurvivorScreen({this.prefs});
}

class _AddSurvivorScreenState extends State<AddSurvivorScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Survivor'),
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

  /*
  CustomFlatButton(
                title: "Invite",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
                onPressed: () async {
                  _setPrefs(_addFieldController.text);
                },
                splashColor: Colors.black12,
                borderColor: Colors.indigoAccent,
                borderWidth: 0,
                color: Colors.indigoAccent,
              ),


   */

  /*



   */


  Future<void> _setPrefs(String uuid) async {
    String str;

    this.widget.prefs = await SharedPreferences.getInstance();

    str = this.widget.prefs.getString("contacts");

    if(str == null) {
      print("Add: $uuid");
      this.widget.prefs.setString("contacts", uuid);
    }
    else {
      print("Add Concat: $str,$uuid");
      this.widget.prefs.setString("contacts", "$str,$uuid");
    }
  }

}
