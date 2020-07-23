import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/AppScreens/TradeItemsScreen.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:trz/Utils/appbar.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:trz/Utils/custom_text_field.dart';
import 'package:trz/Utils/text.dart';
import 'UserMainScreen.dart';
import 'file:///C:/Users/lscunha/AndroidStudioProjects/Project/challenge/lib/Services/Http.dart';

/*

  Functions:
  List Survivors Frieds
  Load on shared preferences


 */

class FriendListScreen extends StatefulWidget {
  static const routeName = '/friendlistscreen';

  @override
  State<StatefulWidget> createState() => new _FriendListScreenState();

  FriendListScreen();
}

class _FriendListScreenState extends State<FriendListScreen> {
  SharedPreferences prefs;
  String survivorIDs;
  List<Survivor> listSurvivor;
  String uniqueId = "Unknown";
  Color color;
  int statusCode;

  @override
  void initState() {
    super.initState();
    listSurvivor = new List<Survivor>();
    color = Colors.white;

    _getPrefs();
    _readPrefs();
  }

  _onBackPressed() {
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Friends', _onBackPressed),
      body: buildContainer(context),
    );
  }

  Widget buildContainer(BuildContext context) {
    if (survivorIDs != null && uniqueId != "Unknown") {
      return ListView.builder(
        itemCount: listSurvivor.length,
        itemBuilder: (context, index) {
          bool infected = listSurvivor[index].returnSurvivorInfected();


          return Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ExpansionTile(
                  title: mediumText(listSurvivor[index].returnSurvivorID()),
                  backgroundColor: color,
                  children: <Widget>[
                    mediumText(listSurvivor[index].printSurvivorInfo()),

                    if(infected == true)
                      bigText("USER INFECTED !!!!", Colors.red),

                    FlatButton(
                      color: Colors.green[700],
                      textColor: Colors.white,
                      onPressed: () async {
                        bool flagDistance = await checkDistanceSurvivors(listSurvivor[index].returnSurvivorID());
                        if ( flagDistance == true || infected == false) {
                          await _setPrefs(listSurvivor[index].returnSurvivorID());
                          Navigator.of(context).pushNamed('/tradeitemscreen');

                        }
                        else {
                          final snackBar = SnackBar(
                            content: Text('For some reason you cant trade him :)'),
                          );

                          Scaffold.of(context).showSnackBar(snackBar);

                        }
                      },
                      child: Text(
                        "Trade",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                    ),
                    FlatButton(
                      color: Colors.green[700],
                      textColor: Colors.white,
                      onPressed: () async {
                        await _setPrefs(listSurvivor[index].returnSurvivorID());
                        int statusCode = await reportInfectedPost();
                        print("STATUS: $statusCode");

                        if(statusCode == 204){
                          final snackBar = SnackBar(
                            content: Text('Survivor reported as infected!'),
                          );

                          Scaffold.of(context).showSnackBar(snackBar);

                        }
                        else{
                          final snackBar = SnackBar(
                            content: Text('Ooops....'),
                          );

                          Scaffold.of(context).showSnackBar(snackBar);

                        }
                      },
                      child: Text(
                        "Report as Infected",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Loading friend list..."),
          ],
        ),
      );
    }
  }

  Future<void> _getPrefs() async {
    List<Survivor> tmpList = new List<Survivor>();
    Survivor surv;
    prefs = await SharedPreferences.getInstance();

    survivorIDs = prefs.getString("contacts");
    var arr = survivorIDs.split(',');

    for (int i = 0; i < arr.length; i++) {
      surv = await fetchSurvivorGet(arr[i]);
      tmpList.add(surv);
    }

    setState(() {
      listSurvivor = tmpList;
    });
  }

  Future<void> _readPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      uniqueId = prefs.getString("id");

    });
  }

  Future<bool> checkDistanceSurvivors(String friendUUID) async {
    Survivor survYou;
    Survivor survFriend;

    survYou = await fetchSurvivorGet (uniqueId);
    survFriend = await fetchSurvivorGet (friendUUID);

    return calcDist(survYou.returnSurvivorPosition(), survFriend.returnSurvivorPosition());

  }


  bool calcDist(String myPos, String friendPos) {
    if (myPos == friendPos)
      return true;
    else
      return false;

  }

  Future<void> _setPrefs(String uuid) async {
    prefs = await SharedPreferences.getInstance();

    bool CheckValue = prefs.containsKey('fid');
    if(CheckValue == null)
      prefs.setString("fid", uuid);
    else{
      prefs.remove("fid");
      prefs.setString("fid", uuid);
    }
  }


}
