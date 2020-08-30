import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paytm_demo/Db_Helper/Transaction_Db_Helper.dart';
import 'package:paytm_demo/Model/Transaction_Model.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';

class Transaction_Screen extends StatefulWidget {
  final String number;

  Transaction_Screen({this.number});

  @override
  _Transaction_ScreenState createState() => _Transaction_ScreenState();
}

class _Transaction_ScreenState extends State<Transaction_Screen> {
  var dbHelper;
  String money = "";
  String time = "";
  bool userImage = true;
  Transactions user;
  List<Transactions> user_data = <Transactions>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = Trasaction_DBHelper();
    fetch_data();
    // userTotalData = user_data;
  }

  void fetch_data() async {
    user_data = await dbHelper.getTransactions();
    validate_user_data();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: SafeArea(
        child: Scaffold(
            body: user_data.length != 0
                ? ListView.builder(
                    itemCount: user_data.length,
                    itemBuilder: (BuildContext context, int index) {
                      // ignore: missing_return
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.blue[900],
                                  child: CustomText(text: user_data[index].id.toString(),color: Colors.white,FontSize: 20,),
                                ),
                                title: CustomText(text: "Transfer Money  Rs:${user_data[index].transactionMoney}",),
                                subtitle: CustomText(text: user_data[index].transactionTime,),
                              ),
                            ),
                            Divider()
                          ],
                        ),
                      );
                    },
                  )
                : Center(child: Text('No Transaction'),),),
      ),
    );
  }

  void validate_user_data() {
    for (int i = 0; i < user_data.length; i++) {
      if (user_data[i].number == widget.number) {
        setState(() {
          money = user_data[i].transactionMoney;
          time = user_data[i].id.toString();
        });
        break;
      }
    }
  }
}
