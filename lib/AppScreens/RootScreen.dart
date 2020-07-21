import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:trz/AppScreens/UserMainScreen.dart';
import 'Register/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
  Check user is registered or not
  Route to Register page , or User page
  Collect Geolocation data
  Collect UUID info
 */

class RootScreen extends StatefulWidget {
  static const routeName = '/rootscreen';

  SharedPreferences prefs;

  @override
  State<StatefulWidget> createState() => new _RootScreenState();
  RootScreen({this.prefs});
}

class _RootScreenState extends State<RootScreen>
{
  Geolocator _geolocator = Geolocator();
  Position _currentPosition;
  String uniqueId = "Unknown";

  @override
  initState() {
    super.initState();
    _getCurrentLocation();
    initPlatformState();


  }

  Widget _body = SpinKitWave(color: Colors.white, type: SpinKitWaveType.start);

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Future<void> _readPrefs() async {
    this.widget.prefs = await SharedPreferences.getInstance();
    setState(() {
      uniqueId = this.widget.prefs.getString("id");

    });
  }

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;

        //setState(() => _body = RegisterScreen(currentPosition: position, uuid: uniqueId, prefs: this.widget.prefs));


        if(uniqueId == null)
          setState(() => _body = RegisterScreen(currentPosition: position, uuid: uniqueId, prefs: this.widget.prefs));
        else
          setState(() => _body = UserMainScreen(currentPosition: position, uuid: uniqueId, prefs: this.widget.prefs));


      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> initPlatformState() async {
    _readPrefs();
  }



}
