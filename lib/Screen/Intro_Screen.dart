import 'package:flutter/material.dart';
import 'package:paytm_demo/Screen/Login_Screen.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';

class Intro_Screen extends StatefulWidget {
  @override
  _Intro_ScreenState createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login_Screen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomColor(),
        body: mainLayout());
  }

  Widget mainLayout() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Expanded(child: scanText()),
        Expanded(child: payText()),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        noKycText(),
        Expanded(
          child: paytmImg(),
          flex: 4,
        ),
      ],
    );
  }

  Widget scanText() {
    return FittedBox(
      child: CustomText(
        text: strings.nowScan,
        color: Colors.blue[900],
        FontSize: 5,
        FontWeights: FontWeight.bold,
      ),
    );
  }

  Widget payText() {
    return CustomText(
      text: strings.payUse,
      color: Colors.blue[900],
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
        color: Colors.blue[900],
      ),
    );
  }

  Widget bottomColor() {
    return Container(
      color: Colors.blue[900],
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
