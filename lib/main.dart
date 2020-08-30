import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paytm_demo/Screen/Home_Screen.dart';
import 'package:paytm_demo/Screen/Intro_Screen.dart';
import 'package:paytm_demo/Size_Config/Size_Config.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String number;
  number = prefs.getString('defaultUser');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: number != null ? Home_Screen(number: number) : Intro_Screen(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Learning Platform Application',
              home: Intro_Screen(),
            );
          },
        );
      },
    );
  }
}
