import 'package:flutter/material.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';

class Successful_Screen extends StatefulWidget {
  @override
  _Successful_ScreenState createState() => _Successful_ScreenState();
}

class _Successful_ScreenState extends State<Successful_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                text: 'Successful Transaction Completed!!!',
                color: Colors.blue[900],
                FontSize: 18,
                FontWeights: FontWeight.w700,
              ),
              RaisedButton(
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('Thank You',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
