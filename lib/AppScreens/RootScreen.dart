import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'Register/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserMainScreen.dart';


//https://www.digitalocean.com/community/tutorials/flutter-geolocator-plugin
//https://medium.com/swlh/working-with-geolocation-and-geocoding-in-flutter-and-integration-with-maps-16fb0bc35ede
//https://gist.github.com/shashank-p/5d1e9a45fbd27560dfa62cdf2a1e6735

class RootScreen extends StatefulWidget {
  static const routeName = '/rootscreen';
  Future<bool>  userExists;

  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var location = new Location();
  Map<String, double> userLocation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //TODO verify user unique ID not working.
    /*
    if(_containsID() == null ) {
      print("new user");
      return new RegisterScreen();
    }
    else{
      print("existing user");
      return new UserMainScreen();
    }

     */

    return new RegisterScreen();

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

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

}
