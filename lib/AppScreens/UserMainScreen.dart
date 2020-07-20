import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert' ;
import 'package:http/http.dart' as http;

class UserMainScreen extends StatefulWidget {
  static const routeName = '/usermainscreen';

  @override
  State<StatefulWidget> createState() => new _UserMainScreenState();

  UserMainScreen();

}

class _UserMainScreenState extends State<UserMainScreen> {
  GoogleMapController mapController;
  LatLng _center;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Resident Zombie'),
        backgroundColor: Colors.green[700],
      ),
      body: _userScreenBuild(context),
      bottomNavigationBar: _bottomAppBarBuild(context),

    );
  }

  Widget _userScreenBuild (BuildContext context) {

      //_center = LatLng(_currentPosition.latitude, _currentPosition.longitude);


    return GoogleMap(
      onMapCreated: _onMapCreated,

      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 18.0,
      ),
    );
  }

  Widget _bottomAppBarBuild (BuildContext context) {
    return BottomAppBar(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => _menuDrawer(),
              );
            },
          ),

          IconButton(
            icon: Icon(Icons.contact_mail),
            onPressed: (){

            },
          ),

          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: (){

            },
          ),

        ],
      ),
    );
  }

  Widget _menuDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Add a survivor!"),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }


}
