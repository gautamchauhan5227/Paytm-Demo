import 'package:flutter/material.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';

class Intro_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomColor(),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              scanText(),
              payText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              noKycText(),
              paytmImg(),
            ],
          )
        ],
      ),
    );
  }

  Widget scanText() {
    return CustomText(
      text: strings.nowScan,
      color: Colors.blueAccent,
      FontSize: 35,
      FontWeights: FontWeight.bold,
    );
  }

  Widget payText() {
    return CustomText(
      text: strings.payUse,
      color: Colors.blueAccent,
      FontSize: 35,
      FontWeights: FontWeight.w400,
    );
  }

  Widget noKycText() {
    return Container(
      width: 230,
      alignment: Alignment.center,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50)),
      child: CustomText(
        text: strings.noWallet,
        FontSize: 12,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget bottomColor() {
    return Container(
      color: Colors.blueAccent,
      height: 40,
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            color: Colors.lightBlue,
          )
        ],
      ),
    );
  }

  Widget paytmImg() {
    return Container(
      height: 380,
      width: 350,
      child: Image.asset(
        "assets/paytmImg.jpeg",
        fit: BoxFit.fill,
      ),
    );
  }
}
