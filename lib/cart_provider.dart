// cart_provider.dart
import 'package:flutter/foundation.dart';
import 'product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double get totalPrice =>
      _items.fold(0, (total, product) => total + product.price);
}
