import 'package:flutter/material.dart';
import 'package:paytm_demo/Db_Helper/User_Db_Helper.dart';
import 'package:paytm_demo/Model/User_Model.dart';
import 'package:paytm_demo/Screen/Home_Screen.dart';
import 'package:paytm_demo/Units/Validation.dart';
import 'package:paytm_demo/Widgets/TextUnit.dart';
import 'package:paytm_demo/Units/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paytm_demo/Screen/Login_Screen.dart';

class Signup_Screen extends StatefulWidget {
  @override
  _Signup_ScreenState createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final formKey = new GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();

  String number, password, name;

  var dbHelper;

  bool _toggleVisibility = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
  }

  setSharedPref(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("defaultUser");
    prefs.setString('defaultUser', number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: mainLayout(),
          ),
        ),
      ),
    );
  }

  Widget mainLayout() {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                welcomeText(),
                SizedBox(
                  height: 15,
                ),
                image(),
                SizedBox(
                  height: 20,
                ),
                signupText(),
                SizedBox(
                  height: 20,
                ),
                numberText(),
                numberTextField(),
                nameText(),
                nameTextField(),
                passwordText(),
                passwordTextField(),
                SizedBox(
                  height: 20,
                ),
                signupButton(),
                SizedBox(
                  height: 15,
                ),
                loginText(),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ));
  }

  Widget welcomeText() {
    return Center(
      child: CustomText(
        text: strings.welcome,
        FontSize: 30,
        color: Colors.blue[900],
        FontWeights: FontWeight.w700,
      ),
    );
  }

  Widget image() {
    return Center(
      child: Container(
        height: 150,
        width: 300,
        child: Image.asset(
          'assets/paytmImg.jpeg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget signupText() {
    return Center(
      child: CustomText(
        text: strings.signup,
        FontSize: 22,
      ),
    );
  }

  Widget numberText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: CustomText(
        text: strings.mobileNumber,
        color: Colors.blueGrey,
        FontSize: 17,
      ),
    );
  }

  Widget numberTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFormField(
        controller: numberController,
        onSaved: (val) => number = val,
        focusNode: _numberFocus,
        textInputAction: TextInputAction.next,
        validator: (value) => validateNumber(value),
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _numberFocus, _nameFocus);
        },
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget nameText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: CustomText(
        text: strings.name,
        color: Colors.blueGrey,
        FontSize: 17,
      ),
    );
  }

  Widget nameTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFormField(
        controller: nameController,
        onSaved: (val) => name = val,
        focusNode: _nameFocus,
        textInputAction: TextInputAction.next,
//        validator: (value) => validateNumber(value),
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _nameFocus, _passwordFocus);
        },
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
        controller: passwordController,
        onSaved: (val) => password = val,
        focusNode: _passwordFocus,
        textInputAction: TextInputAction.done,
        obscureText: _toggleVisibility,
        validator: (value) => validatePassword(value),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _toggleVisibility = !_toggleVisibility;
              });
            },
            icon: _toggleVisibility
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          ),
        ),
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget signupButton() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: validate,
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
                text: strings.proceedSingup,
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

  Widget loginText() {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login_Screen()));
        },
        child: CustomText(
          text: strings.login,
          color: Colors.lightBlue,
          FontSize: 20,
          FontWeights: FontWeight.w900,
        ),
      ),
    );
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      User data = User(null, name, number, password);
      dbHelper.save(data);
      setSharedPref(number);
      clearName();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home_Screen(
                  number: number,
                ),
        ),
      );
    } else {
      return failAlert(context);
    }
  }

  clearName() {
    nameController.text = '';
    numberController.text = '';
    passwordController.text = '';
  }

  Future<void> failAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: strings.regFail,
            FontSize: 16,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
