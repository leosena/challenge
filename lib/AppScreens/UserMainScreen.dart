import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:trz/Utils/post_get_api.dart';

/*
  Main user screen
  Data of location

  Not Registered:
  Get data of the new survivor and update

  or

  Registered
  Get data of registered survivor and update


  Functions:
  List of contacts
  Add Survivor


 */

class UserMainScreen extends StatefulWidget {
  static const routeName = '/usermainscreen';

  Position currentPosition;
  String uuid;

  SharedPreferences prefs;

  @override
  State<StatefulWidget> createState() => new _UserMainScreenState();

  UserMainScreen({this.currentPosition, this.uuid, this.prefs});
}

class _UserMainScreenState extends State<UserMainScreen> {
  GoogleMapController mapController;
  Future<Survivor> futureSurvivor;


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    print(this.widget.uuid);
    super.initState();
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
