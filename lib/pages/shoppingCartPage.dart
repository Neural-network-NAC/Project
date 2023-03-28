import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/item.dart';

// Create a stateful widget for your shopping cart screen
class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  Item test =
      Item(description: "testing", name: "Aneesh", price: 200, quantity: 20);
  List<Item> _cartItems = [];

  double get _totalPrice => _cartItems.fold(
      0, (previousValue, item) => previousValue + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Shopping Cart'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          Item test2 = Item(
              description: "Description here",
              name: "Nescafe",
              price: Random().nextInt(90) + 10,
              quantity: Random().nextInt(10) + 1);
          //test2.price = Random().nextInt(90) + 10;
          _cartItems.add(test2);
        });
      }),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final item = _cartItems[index];
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                _cartItems.removeAt(index);
              });
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
                      Text(
                        item.name,
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 15,
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
                          onPressed: () {
                            // Increase item quantity
                            if (item.quantity < 999) {
                              setState(() {
                                item.quantity++;
                              });
                            }
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text(item.quantity.toString()),
                        IconButton(
                          onPressed: () {
                            // Reduce item quantity
                            if (item.quantity > 1) {
                              setState(() {
                                item.quantity--;
                              });
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
              'Total: \$${_totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                // Implement your checkout process here
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  // Implement a way to add items to the cart
  void addItemToCart(Item item) {
    setState(() {
      final index =
          _cartItems.indexWhere((cartItem) => cartItem.name == item.name);
      if (index != -1) {
        _cartItems[index].quantity += item.quantity;
      } else {
        _cartItems.add(item);
      }
    });
  }
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
