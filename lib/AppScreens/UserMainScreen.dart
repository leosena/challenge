import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:trz/Services/Http.dart';
import 'package:trz/Utils/appbar.dart';

import 'AddSurvivorScreen.dart';
import 'FriendListScreen.dart';

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
  String uuid, lastScreen;


  @override
  State<StatefulWidget> createState() => new _UserMainScreenState();

  UserMainScreen({this.currentPosition, this.uuid, this.lastScreen});
}

class _UserMainScreenState extends State<UserMainScreen> {
  SharedPreferences prefs;

  GoogleMapController mapController;


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    if(this.widget.lastScreen == "root")
      getRequest(this.widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('The Resident Zombie', null),
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
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            onPressed: () {
              Navigator.of(context).pushNamed('/friendlistscreen');
              /*
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          FriendListScreen(uuid: this.widget.uuid, prefs: this.widget.prefs)),
                      (Route<dynamic> route) => false);

               */
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
            onTap: () {

              Navigator.of(context).pushNamed('/addsurvivorscreen');

              /*
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          AddSurvivorScreen(prefs: this.widget.prefs)),
                      (Route<dynamic> route) => false);

               */


            },
          ),
        ],
      ),
    );
  }

  Future<void> getRequest(String uid) async {
    Survivor postSurv;
    Survivor surv = await fetchSurvivorGet(this.widget.uuid);

    postSurv = await updateSurvivorPost(surv.name, surv.age.toString(), surv.gender, this.widget.currentPosition.latitude.toString(), this.widget.currentPosition.longitude.toString(), this.widget.uuid);

  }

}
