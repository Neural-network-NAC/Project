import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/HomePage.dart';
import 'package:project/pages/login_register_page.dart';
import 'package:project/pages/mainscreen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "homePage": (context) => HomePage(),
      },
    );
  }
}
