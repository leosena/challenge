import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Classes/Items.dart';
import 'package:trz/Utils/add_sub_button_trade.dart';
import 'package:trz/Utils/appbar.dart';
import 'package:trz/Utils/custom_flat_button.dart';


class TradeItemsScreen extends StatefulWidget {
  static const routeName = '/tradeitemscreen';

  @override
  State<StatefulWidget> createState() => new _TradeItemsScreenState();
}


class _TradeItemsScreenState extends State<TradeItemsScreen> {
  SharedPreferences prefs;
  AddSubButtonTrade btn;

  int totalMoneyP1,
      totalMoneyP2;

  String id;

  @override
  void initState() {
    totalMoneyP1 = 0;
    totalMoneyP2 = 0;
  }

  _onBackPressed() {
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar('Trade System', _onBackPressed),
      body: _buildPlayerItems(context),
    );
  }


  Widget _buildPlayerItems(BuildContext context) {
    List<AddSubButtonTrade> listButtons = new List<AddSubButtonTrade>();


    return  ListView.builder(
        itemCount: itemData_register.length,
        itemBuilder: (context, index) {

          btn = new AddSubButtonTrade(index: index);
          listButtons.add(btn);


          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Padding(padding: EdgeInsets.only(bottom: 15.0, top: 5.0)),
              if(index == 0)
                Text("Your Items:"),
              if (index == 4)
                Text("Friend Items:"),

              Padding(padding: EdgeInsets.only(bottom: 15.0, top: 5.0)),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text("${itemData_register[index].name}"),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 5.0),
                  ),
                  Container(
                    child: btn,
                    alignment: Alignment.topRight,
                  ),
                ],
              ),


              if (index == 7)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: CustomFlatButton(
                    title: "Trade",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.white,
                    onPressed: () async {

                      bool transactionDone = await ifFairTrade();

                      if(transactionDone == true){
                        final snackBar = SnackBar(
                          content: Text('Trade succeed!'),

                        );

                        Scaffold.of(context).showSnackBar(snackBar);

                      }
                      else{
                        final snackBar = SnackBar(
                          content: Text('Unfair Trade!'),
                        );

                        Scaffold.of(context).showSnackBar(snackBar);
                      }

                    },
                    splashColor: Colors.black12,
                    borderColor: Colors.black,
                    borderWidth: 0,
                    color: Colors.lightGreen,
                  ),
                ),



            ],
          );
        }
      );
  }

  Future<bool> ifFairTrade() async {


    return true;
  }
}
