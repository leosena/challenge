import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'Register/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/rootscreen';

  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  Geolocator _geolocator = Geolocator();
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

  }

  Widget _body = SpinKitWave(color: Colors.white, type: SpinKitWaveType.start);

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Future<String> _readPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("id");
  }

  Future<bool> _containsID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("id found:");
    print(prefs.getString("id"));
    return prefs.containsKey("id");
  }

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');

        //TODO verify user unique ID not working.
        setState(() => _body = RegisterScreen(currentPosition: position,));
      });
    }).catchError((e) {
      print(e);
    });
  }


}
