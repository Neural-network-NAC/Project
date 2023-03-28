import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.description});
}

class ShoppingCart {
  final List<Product> products;

  ShoppingCart({required this.products});

  double get totalPrice =>
      products.fold(0, (total, product) => total + product.price);
}

class ShoppingCartItem extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  ShoppingCartItem({required this.product, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle),
        onPressed: onRemove,
      ),
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  final ShoppingCart cart;
  final FirebaseFirestore firestore;

  ShoppingCartScreen({required this.cart, required this.firestore});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.products.length,
              itemBuilder: (context, index) => ShoppingCartItem(
                product: widget.cart.products[index],
                onRemove: () {
                  setState(() {
                    widget.cart.products.removeAt(index);
                    widget.firestore
                        .collection('shopping_carts')
                        .doc('cart1')
                        .update({
                      'products': widget.cart.products
                          .map((p) => {
                                'name': p.name,
                                'price': p.price,
                                'image': p.image,
                                'description': p.description
                              })
                          .toList(),
                    });
                  });
                },
              ),
            ),
          ),
          Text(
            'Total Price: \$${widget.cart.totalPrice}',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
