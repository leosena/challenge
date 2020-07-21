import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:device_id/device_id.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imei_plugin/imei_plugin.dart';

class UserMainScreen extends StatefulWidget {
  static const routeName = '/usermainscreen';

  Position currentPosition;

  @override
  State<StatefulWidget> createState() => new _UserMainScreenState();

  UserMainScreen({this.currentPosition});
}

class _UserMainScreenState extends State<UserMainScreen> {
  GoogleMapController mapController;
  //String _deviceid = 'Unknown';
  String uniqueId = "Unknown";


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();

  }

  Future<void> initPlatformState() async {
    String idunique;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      idunique = await ImeiPlugin.getId();
    } on PlatformException {
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      uniqueId = idunique;
      print("unique ID : $uniqueId" );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Resident Zombie'),
        backgroundColor: Colors.green[700],
      ),
      body: buildContainer(context),
      bottomNavigationBar: _bottomAppBarBuild(context),
    );
  }

  Widget buildContainer(BuildContext context) {
    return _userScreenBuild(context);
  }

  Widget _userScreenBuild(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(this.widget.currentPosition.latitude,
            this.widget.currentPosition.longitude),
        zoom: 18.0,
      ),
    );
  }

  Widget _bottomAppBarBuild(BuildContext context) {
    return BottomAppBar(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => _menuDrawer(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.contact_mail),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
