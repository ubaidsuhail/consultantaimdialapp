import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:consultantaimdialapp/splashscreen.dart';
import 'package:consultantaimdialapp/services/selectservice.dart';
import 'package:consultantaimdialapp/business/businesslist.dart';
import 'package:consultantaimdialapp/bar/bottombar.dart';
import 'package:consultantaimdialapp/services/viewinsight.dart';


void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      'SelectServices' : (BuildContext context) =>SelectService(),
      'BusinessLists' : (BuildContext context) =>BusinessList(),
      'BottomBars' : (BuildContext context) =>BottomBar(),
      'ViewInsights' : (BuildContext context) =>ViewInsight(),

    },
  ));
}