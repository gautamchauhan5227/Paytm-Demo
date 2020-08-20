import 'package:flutter/material.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';

class Login_Screen extends StatefulWidget {
  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            child: mainLayout(),
          ),
        ),
      ),
    );
  }

  Widget mainLayout() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buttonLayout(),
              loginText(),
              payText(),
              mobileText(),
              mobileTextField(),
              passwordText(),
              passwordTextField(),
              needText(),
              loginButton(),
              SizedBox(
                height: 10,
              ),
              createAccount(),
              SizedBox(
                height: 10,
              ),
              termAndConditionText()
            ],
          ),
        )
      ],
    );
  }

  Widget buttonLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: 130.0, top: 30),
      child: Row(
        children: [
          OutlineButton(
            color: Colors.white,
            child: new CustomText(
              text: strings.changeLanguage,
              FontWeights: FontWeight.bold,
              FontSize: 16,
            ),
            onPressed: null,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          OutlineButton(
            color: Colors.white,
            child: new CustomText(
              text: strings.skip,
              FontSize: 16,
              FontWeights: FontWeight.bold,
            ),
            onPressed: null,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomText(
        text: strings.loginOrCreateAccount,
        FontSize: 25,
        FontWeights: FontWeight.bold,
      ),
    );
  }

  Widget payText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CustomText(
        text: strings.payUsingUpi,
        FontSize: 18,
        color: Colors.blueGrey,
      ),
    );
  }

  Widget mobileText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: CustomText(
        text: strings.mobileNumber,
        color: Colors.blueGrey,
        FontSize: 17,
      ),
    );
  }

  Widget mobileTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget passwordText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: CustomText(
        text: strings.password,
        color: Colors.blueGrey,
        FontSize: 17,
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget needText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: CustomText(
          text: strings.needHelp,
          color: Colors.lightBlue,
          FontSize: 16,
          FontWeights: FontWeight.w800,
        ),
      ),
    );
  }

  Widget loginButton() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: null,
        child: Container(
          height: 50,
          width: 340,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: strings.proceedLogin,
                FontSize: 20,
                FontWeights: FontWeight.bold,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createAccount() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: null,
        child: CustomText(
          text: strings.createAccount,
          color: Colors.lightBlue,
          FontSize: 18,
        ),
      ),
    );
  }

  Widget termAndConditionText() {
    return CustomText(
      text: strings.termAndCondition,
      maxLine: 2,
      color: Colors.grey,
    );
  }
}
