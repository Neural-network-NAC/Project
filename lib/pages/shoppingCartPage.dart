import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/pages/HomePage.dart';
import 'package:project/utils/item_list_provider.dart';
import 'package:project/utils/item_list_shared_prefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/item.dart';

// Create a stateful widget for your shopping cart screen
class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<Item> _cartItems = [];

  double get _totalPrice => _cartItems.fold(
      0, (previousValue, item) => previousValue + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    _cartItems = Provider.of<ItemListProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Shopping Cart'),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {
      //     Item test2 = Item(
      //       description: "Description here",
      //       name: "Nescafe",
      //       price: Random().nextInt(90) + 10,
      //       quantity: Random().nextInt(10) + 1,
      //       availableQuantity: 30,
      //     );

      //     //test2.price = Random().nextInt(90) + 10;
      //     _cartItems.add(test2);
      //   });
      // }),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final item = _cartItems[index];
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) async {
              setState(() {
                Provider.of<ItemListProvider>(context, listen: false)
                    .removeItem(_cartItems[index]);
              });
              await removeItem(index);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Item deleted")));
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Image.network(
                  //     "https://healthix.org/wp-content/uploads/2016/06/testimage.jpeg"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5)),
                      SizedBox(
                        width: 190,
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      SizedBox(
                        width: 160,
                        child: Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Text(
                        "Total: ${item.quantity} x ₹${item.price} = ${item.quantity * item.price}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                    ],
                  ),
                  Card(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            // Increase item quantity
                            if (item.quantity < 999) {
                              setState(() {
                                if (item.checkQuantity()) {
                                  //item.quantity++;
                                  Provider.of<ItemListProvider>(context,
                                          listen: false)
                                      .items[index]
                                      .quantity++;
                                }
                              });
                              updateItemQuantity(
                                  index,
                                  Provider.of<ItemListProvider>(context,
                                          listen: false)
                                      .items[index]
                                      .quantity);
                            }
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text(item.quantity.toString()),
                        IconButton(
                          onPressed: () async {
                            // Reduce item quantity
                            if (item.quantity > 1) {
                              setState(() {
                                Provider.of<ItemListProvider>(context,
                                        listen: false)
                                    .items[index]
                                    .quantity--;
                              });
                              updateItemQuantity(
                                  index,
                                  Provider.of<ItemListProvider>(context,
                                          listen: false)
                                      .items[index]
                                      .quantity);
                            }
                          },
                          icon: Icon(Icons.remove),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Total: ₹${_totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                Provider.of<ItemListProvider>(context, listen: false).items =
                    [];
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Checkout successful!")));
                if (mounted) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage()));
                }
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  // Implement a way to add items to the cart
  // void addItemToCart(Item item) {
  //   setState(() {
  //     final index =
  //         _cartItems.indexWhere((cartItem) => cartItem.name == item.name);
  //     if (index != -1) {
  //       _cartItems[index].quantity += item.quantity;
  //     } else {
  //       _cartItems.add(item);
  //     }
  //   });
  // }
}

// class ShoppingCartItemCard extends StatefulWidget {
//   const ShoppingCartItemCard({super.key});

//   @override
//   State<ShoppingCartItemCard> createState() => _ShoppingCartItemCardState();
// }

// class _ShoppingCartItemCardState extends State<ShoppingCartItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Row(
//         children: [
//           Image.network(
//               "https://healthix.org/wp-content/uploads/2016/06/testimage.jpeg"),
//           Column(
//             children: [
//               Text("Nescafe"),
//               Text(
//                 "Description/Subtype here",
//                 style: TextStyle(
//                   fontSize: 12,
//                 ),
//               ),
//               Text(
//                 "20 items x \$200 = \$4000",
//                 style: TextStyle(
//                   fontSize: 12,
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // Increase item quantity
//                 },
//                 icon: Icon(Icons.add),
//               ),
//               Text("20"),
//               IconButton(
//                 onPressed: () {
//                   // Reduce item quantity
//                 },
//                 icon: Icon(Icons.remove),
//               )
//             ],
//           ),
//           IconButton(
//             onPressed: () {
//               // Remove item from shopping cart
//               setState(() {
//                       _cartItems.removeAt(index);
//                     });
//             },
//             icon: Icon(
//               Icons.close,
//               color: Colors.white,
//             ),
//             color: Colors.red,
//             iconSize: 20,
//             padding: EdgeInsets.all(8),
//             splashRadius: 20,
//             splashColor: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
