import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Floorplan/core/core/view/view/screens/floorplan_screen.dart';
import 'package:project/Floorplan/core/core/viewmodels/floorplan_model.dart';
import 'package:project/pages/SplashScreen.dart';
import 'package:project/pages/mainscreen.dart';
import 'package:project/widgets/CategoriesWidget.dart';
import 'package:badges/src/badge.dart' as badge;

import '../widgets/ItemsWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF00A368),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      
                      
                      Container(
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FloorPlanScreen()),
                              );
                            },
                            icon: Icon(
                              CupertinoIcons.map,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),

                //       InkWell(
                // onTap: () {
                //   Navigator.pushReplacementNamed(context,
                //       "floorplan_screen"); //Won't go back to this screen again becaused I used pushed replacement
                // },
                // child: Ink(
                //     padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         color: Color(0xff00A368)),
                //     child: Text(
                //       "Get Started",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ))),




                      

                      // Icon(

                      //   CupertinoIcons.camera,
                      //   color: Colors.white,
                      //   size: 30,
                      // ),
                      Container(
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()),
                              );
                            },
                            icon: Icon(
                              CupertinoIcons.camera,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0XFF00A368),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 2,
                              ),
                            ]),
                        child: badge.Badge(
                          badgeColor: Colors.red,
                          padding: EdgeInsets.all(7),
                          badgeContent: Text(
                            "3",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              CupertinoIcons.cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),

              //Welcome and What do you want to buy.
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  Text(
                    "What do you want to buy?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),

              //Search Widget
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 240,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),

              // Products Widgets

              Container(
                margin: EdgeInsets.all(8),
                //margin: EdgeInsets.only(top: 15, bottom: 20),
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    // bottomLeft: Radius.circular(30),
                    // bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(8),
                //margin: EdgeInsets.only(top: 15, bottom: 20),
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    // bottomLeft: Radius.circular(30),
                    // bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
