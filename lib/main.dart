import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:project/Floorplan/core/core/view/view/screens/floorplan_screen.dart';
import 'package:project/Floorplan/core/core/viewmodels/floorplan_model.dart';
import 'package:project/pages/HomePage.dart';
import 'package:project/pages/login_register_page.dart';
import 'package:project/pages/mainscreen.dart';
import 'package:provider/provider.dart';
import 'pages/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widget_tree.dart';
import 'package:carousel_slider/carousel_slider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
  providers: [
    ChangeNotifierProvider(
          create: (context) => FloorPlanModel(),
        )
  ],
  child:MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "homePage": (context) => HomePage(),
        //"floorplan_screen": (context) => FloorPlanScreen(),

      },
    ));
  }
}
