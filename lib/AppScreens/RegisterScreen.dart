import 'package:flutter/material.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:trz/Utils/custom_text_field.dart';
import 'package:trz/Utils/validator.dart';


class RegisterScreen extends StatefulWidget {
  static const routeName = '/registerscreen';

  @override
  State<StatefulWidget> createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    final TextEditingController _fullname = new TextEditingController();
    final TextEditingController _age = new TextEditingController();
    final TextEditingController _gender = new TextEditingController();

    //todo Localization
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
        //validator: Validator.validateName,
      );
      _ageField = new CustomTextField(
        baseColor: Colors.grey,
        borderColor: Colors.grey[400],
        errorColor: Colors.red,
        controller: _age,
        hint: "Age *",
        validator: Validator.validateNumberPhone,
        inputType: TextInputType.number,
      );
      _genderField = new CustomTextField(
        baseColor: Colors.grey,
        borderColor: Colors.grey[400],
        errorColor: Colors.red,
        controller: _gender,
        hint: "Gender *",
        validator: Validator.validateName,
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
                  Colors.indigoAccent[100],
                  Colors.grey[100],
                  Colors.grey[100],
                  Colors.grey[100],
                ],
              ),
            ),
            child: Stack(
              children: <Widget>[
                Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    ListView(

                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 150.0, bottom: 10.0, left: 10.0, right: 10.0),
                          child: Icon(Icons.supervisor_account,
                            color: Colors.indigoAccent,
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
                              vertical: 14.0, horizontal: 40.0),
                          child: CustomFlatButton(
                            title: "Create Survivor",
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white,
                            onPressed: () {

                            },
                            splashColor: Colors.black12,
                            borderColor: Colors.indigoAccent,
                            borderWidth: 0,
                            color: Colors.indigoAccent,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
}