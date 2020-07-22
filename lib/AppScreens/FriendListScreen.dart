import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/AppScreens/TradeItemsScreen.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:trz/Utils/appbar.dart';
import 'package:trz/Utils/custom_flat_button.dart';
import 'package:trz/Utils/custom_text_field.dart';
import 'file:///C:/Users/lscunha/AndroidStudioProjects/Project/challenge/lib/Services/Http.dart';

/*

  Functions:
  List Survivors Frieds
  Load on shared preferences


 */

class FriendListScreen extends StatefulWidget {
  static const routeName = '/addsurvivorscreen';
  SharedPreferences prefs;
  String uuid;

  @override
  State<StatefulWidget> createState() => new _FriendListScreenState();

  FriendListScreen({this.uuid, this.prefs});
}

class _FriendListScreenState extends State<FriendListScreen> {
  String survivorIDs;
  List<Survivor> listSurvivor;

  Color color = Color(0xFFFFDFDFDF);

  @override
  void initState() {
    super.initState();
    listSurvivor = new List<Survivor>();

    _getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Friends'),
      body: buildContainer(context),
    );
  }

  Widget buildContainer(BuildContext context) {
    if (survivorIDs != null) {
      return ListView.builder(
        itemCount: listSurvivor.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),

            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
              ),
              color: Color(0xFFFF7F7F7F),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ExpansionTile(
                  title: Text(listSurvivor[index].returnSurvivorID()),
                  children: <Widget>[
                    Text(listSurvivor[index].printSurvivorInfo()),
                    FlatButton(
                      color: Colors.green[700],
                      textColor: Colors.white,
                      onPressed: () {
                        if (checkDistanceSurvivors() == true) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => TradeItemsScreen(
                                      uuid: this.widget.uuid,
                                      friendUuid: listSurvivor[index]
                                          .returnSurvivorID(),
                                      prefs: this.widget.prefs)),
                              (Route<dynamic> route) => false);
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
                      onPressed: () {
                        setState(() {
                        });
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
    this.widget.prefs = await SharedPreferences.getInstance();

    survivorIDs = this.widget.prefs.getString("contacts");
    var arr = survivorIDs.split(',');

    for (int i = 0; i < arr.length; i++) {
      surv = await fetchSurvivorGet(arr[i]);
      tmpList.add(surv);
    }

    setState(() {
      listSurvivor = tmpList;
    });
  }

  bool checkDistanceSurvivors() {
    //TODO

    return true;
  }
}
