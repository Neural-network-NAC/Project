import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/models/product.dart';
//import 'dart:html';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageasset = [1, 2, 3, 4, 5, 6, 7, 8];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Super Savers",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff00A368)),
              ),
              Text(
                "Upto 30% Off",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, //This makes the rown scrollable
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 200,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/chocobak.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     "Deodrants",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/digestive.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     "Daily Essentials",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/jim.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     "HealthCare",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/nutri choice.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     "Groceries",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/oreo.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     "Cold Drinks",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/tiger.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     "Fast Food",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/orange.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 5),
                    //   child: Text(
                    //     "Quick Bites",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
