// Sanjyot Phadatare #GripMarch23
//Task 2 : Basic Banking App
// Language - Dart
// Framework - Flutter
// Database - sqlite


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:basic_banking_app/screens/homeScreen.dart';
import 'package:basic_banking_app/screens/screen_onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
  var isFirstTime = prefs.getBool(boolKey) ?? true;

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Banking App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.transparent),
      ),
      home: isFirstTime
          ? ScreenOnBoarding(
              prefs: prefs,
              boolKey: boolKey,
            )
          : HomeScreen()));
}
