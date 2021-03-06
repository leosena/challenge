import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:trz/Utils/custom_text_field.dart';
import 'package:trz/Utils/validator.dart';
import 'package:geolocator/geolocator.dart';

import 'ItemsChooseScreen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/registerscreen';
  Position currentPosition;
  String uuid;
  SharedPreferences prefs;

  @override
  State<StatefulWidget> createState() => new _RegisterScreenState();
  RegisterScreen({this.currentPosition, this.uuid, this.prefs});
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullname = new TextEditingController();
  final TextEditingController _age = new TextEditingController();
  final TextEditingController _gender = new TextEditingController();

  //todo items

  CustomTextField _nameField;
  CustomTextField _ageField;
  CustomTextField _genderField;

  @override
  void initState() {
    super.initState();
    _nameField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _fullname,
      hint: "Name *",
      validator: Validator.validateName,
    );
    _ageField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _age,
      hint: "Age *",
      validator: Validator.validateAge,
    );
    _genderField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _gender,
      hint: "Gender *",
      validator: Validator.validateGender,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.green[400],
                Colors.white,
                Colors.green[400],
                Colors.green[500],
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              ListView(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 150.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Icon(
                    Icons.supervisor_account,
                    color: Colors.lightGreen,
                    size: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                  child: _nameField,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.0, bottom: 10.0, left: 15.0, right: 15.0),
                  child: _ageField,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.0, bottom: 10.0, left: 15.0, right: 15.0),
                  child: _genderField,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: CustomFlatButton(
                    title: "Next",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.white,
                    onPressed: () {

                      if (Validator.validateName(_fullname.text) &&
                          Validator.validateAge(_age.text) &&
                          Validator.validateGender(_gender.text))
                       Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ItemsChooseScreen(
                                    name: _fullname.text,
                                    age: _age.text,
                                    gender: _gender.text,
                                    currentPosition: this.widget.currentPosition,
                                    uuid: this.widget.uuid,
                                    prefs: this.widget.prefs))
                        );

                    },
                    splashColor: Colors.black12,
                    borderColor: Colors.black,
                    borderWidth: 0,
                    color: Colors.lightGreen,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
