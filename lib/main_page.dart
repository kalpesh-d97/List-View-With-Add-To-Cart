// main_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'product.dart';

class MainPage extends StatelessWidget {
  final List<Product> _products = [
    Product(
        id: '1',
        name: 'Iphone 12',
        price: 50000,
        image: Image.asset(
            'E:\Development\Add Cart Project\add_to_cart\lib\assets\ip12.png')),
    Product(
        id: '2',
        name: 'Iphone 13',
        price: 70000,
        image: Image.asset(
            'E:\Development\Add Cart Project\add_to_cart\lib\assets\ip13.png')),
    Product(
        id: '3',
        name: 'Iphone 14',
        price: 85000,
        image: Image.asset(
            'E:\Development\Add Cart Project\add_to_cart\lib\assets\ip14.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To KDs Apple Hub'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\₹${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(product);
              },
            ),
          );
        },
      ),
    );
  }
}
