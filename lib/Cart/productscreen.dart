// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:project/Cart/shoppingcart.dart';

// class ProductScreen extends StatelessWidget {
//   final FirebaseFirestore firestore;

//   ProductScreen({required this.firestore});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: firestore.collection('products').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final data = snapshot.data!.docs[index].data();
//               final product = Product(name: data!['name'], price: data['price']??.toDouble(), image: data['image'], description: data['description']);
//               return ListTile(
//                 title: Text(product.name),
//                 trailing: Text('\$${product.price}'),
//                 onTap: () {
//                   final cart = ShoppingCart(products: [product]);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ShoppingCartScreen(cart: cart, firestore: firestore),
//                     ),
//                   );

//                   firestore.collection('shopping_carts').doc('cart1').update({
//                     'products': FieldValue.arrayUnion([{
//                       'name': product.name,
//                       'price': product.price,
//                       'image': product.image,
//                       'description': product.description,
//                     }])
//                   });
//                 },
//      );     },);},););},

//   }