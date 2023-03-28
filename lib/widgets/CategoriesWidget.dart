import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/models/product.dart';
//import 'dart:html';

class CategoriesWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: CarouselSlider(
//         options: CarouselOptions(
//           height: 450,
//           aspectRatio: 16 / 9,
//           viewportFraction: 0.70,
//         ),
//         items: Product.map((product) {
//           return Builder(builder: (context) {
//             return GestureDetector(
//               onTap: () {},
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 decoration: const BoxDecoration(),
//                 child: SingleChildScrollView(
//                   child: Column(children: [
//                     Container(
//                       height: 320,
//                       child: Image.network(
//                         product['image'],
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   ]),
//                 ),
//               ),
//             );
//           });
//         }),
//       ),
//     ));
//   }

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
                "Categories",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff00A368)),
              ),
              Text(
                "See All",
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
                height: 70,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/1.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "Deodrants",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/3.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "Daily Essentials",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/4.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "HealthCare",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/5.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "Groceries",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/6.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "Cold Drinks",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/7.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "Fast Food",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "images/8.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        "Quick Bites",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Padding(
        //   padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "Super Saver Offers",
        //         style: TextStyle(
        //             fontSize: 25,
        //             fontWeight: FontWeight.bold,
        //             color: Color(0xff00A368)),
        //       ),
        //       Text(
        //         "Upto 30% off",
        //         style: TextStyle(
        //           fontSize: 15,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.black,
        //         ),
        //       )
        //     ],
        //   ),
        // ),

        // Container(
        //   padding: EdgeInsets.only(top: 20),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(30),
        //       topRight: Radius.circular(30),
        //     ),
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       SingleChildScrollView(
        //         scrollDirection:
        //             Axis.horizontal, //This makes the rown scrollable
        //         child: Row(
        //           children: [
        //             Container(
        //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //               height: 300,
        //               decoration: BoxDecoration(color: Colors.white),
        //               child: Row(
        //                 children: [
        //                   Padding(
        //                     padding: EdgeInsets.all(5),
        //                     child: Image.asset(
        //                       "images/chocobak.jpg",
        //                       height: 200,
        //                       width: 200,
        //                     ),
        //                   ),
        //                   // Padding(
        //                   //   padding: EdgeInsets.only(right: 5),
        //                   //   child: Text(
        //                   //     "Deodrants",
        //                   //     style: TextStyle(
        //                   //         fontSize: 16, fontWeight: FontWeight.bold),
        //                   //   ),
        //                   // ),
        //                   Padding(
        //                     padding: EdgeInsets.all(5),
        //                     child: Image.asset(
        //                       "images/digestive.jpg",
        //                       height: 200,
        //                       width: 200,
        //                     ),
        //                   ),
        //                   // Padding(
        //                   //   padding: EdgeInsets.only(right: 5),
        //                   //   child: Text(
        //                   //     "Daily Essentials",
        //                   //     style: TextStyle(
        //                   //         fontSize: 16, fontWeight: FontWeight.bold),
        //                   //   ),
        //                   // ),
        //                   Padding(
        //                     padding: EdgeInsets.all(5),
        //                     child: Image.asset(
        //                       "images/jim.jpg",
        //                       height: 200,
        //                       width: 200,
        //                     ),
        //                   ),
        //                   // Padding(
        //                   //   padding: EdgeInsets.only(right: 5),
        //                   //   child: Text(
        //                   //     "HealthCare",
        //                   //     style: TextStyle(
        //                   //         fontSize: 16, fontWeight: FontWeight.bold),
        //                   //   ),
        //                   // ),
        //                   Padding(
        //                     padding: EdgeInsets.all(5),
        //                     child: Image.asset(
        //                       "images/nutri choice.jpg",
        //                       height: 200,
        //                       width: 200,
        //                     ),
        //                   ),
        //                   // Padding(
        //                   //   padding: EdgeInsets.only(right: 5),
        //                   //   child: Text(
        //                   //     "Groceries",
        //                   //     style: TextStyle(
        //                   //         fontSize: 16, fontWeight: FontWeight.bold),
        //                   //   ),
        //                   // ),
        //                   Padding(
        //                     padding: EdgeInsets.all(5),
        //                     child: Image.asset(
        //                       "images/oreo.jpg",
        //                       height: 200,
        //                       width: 200,
        //                     ),
        //                   ),
        //                   // Padding(
        //                   //   padding: EdgeInsets.only(right: 5),
        //                   //   child: Text(
        //                   //     "Cold Drinks",
        //                   //     style: TextStyle(
        //                   //         fontSize: 16, fontWeight: FontWeight.bold),
        //                   //   ),
        //                   // ),
        //                   Padding(
        //                     padding: EdgeInsets.all(5),
        //                     child: Image.asset(
        //                       "images/tiger.jpg",
        //                       height: 200,
        //                       width: 200,
        //                     ),
        //                   ),
        //                   // Padding(
        //                   //   padding: EdgeInsets.only(right: 5),
        //                   //   child: Text(
        //                   //     "Fast Food",
        //                   //     style: TextStyle(
        //                   //         fontSize: 16, fontWeight: FontWeight.bold),
        //                   //   ),
        //                   // ),
        //                   Padding(
        //                     padding: EdgeInsets.all(5),
        //                     child: Image.asset(
        //                       "images/orange.jpg",
        //                       height: 200,
        //                       width: 200,
        //                     ),
        //                   ),
        //                   // Padding(
        //                   //   padding: EdgeInsets.only(right: 5),
        //                   //   child: Text(
        //                   //     "Quick Bites",
        //                   //     style: TextStyle(
        //                   //         fontSize: 16, fontWeight: FontWeight.bold),
        //                   //   ),
        //                   // ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal, //This makes the rown scrollable
        //   child: Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //         height: 300,
        //         decoration: BoxDecoration(color: Colors.white),
        //         child: Row(
        //           children: [
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/chocobak.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Deodrants",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/digestive.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Daily Essentials",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/jim.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "HealthCare",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/nutri choice.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Groceries",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/oreo.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Cold Drinks",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/tiger.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Fast Food",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/orange.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Quick Bites",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal, //This makes the rown scrollable
        //   child: Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //         height: 300,
        //         decoration: BoxDecoration(color: Colors.white),
        //         child: Row(
        //           children: [
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/chocobak.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Deodrants",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/digestive.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Daily Essentials",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/jim.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "HealthCare",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/nutri choice.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Groceries",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/oreo.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Cold Drinks",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/tiger.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Fast Food",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //             Padding(
        //               padding: EdgeInsets.all(5),
        //               child: Image.asset(
        //                 "images/orange.jpg",
        //                 height: 200,
        //                 width: 200,
        //               ),
        //             ),
        //             // Padding(
        //             //   padding: EdgeInsets.only(right: 5),
        //             //   child: Text(
        //             //     "Quick Bites",
        //             //     style: TextStyle(
        //             //         fontSize: 16, fontWeight: FontWeight.bold),
        //             //   ),
        //             // ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
//}
// class _products {
//   late String Horlicks;
//   late String brand;
//   late String imageURL;
//   late int price;

//   static map(Builder Function(dynamic product) param0) {}

//   Product(this.name, this.brand, this.imageURL, this.price);

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return new Product(
//       json["name"],
//       json["brand"],
//       json["imageURL"],
//       json["price"]
//     );
//   }
// }
