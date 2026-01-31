import 'package:flutter/foundation.dart';
import '../model/product.dart';

class CartItem {
  final Product product;
  int qty;

  CartItem({required this.product, this.qty = 1});
}

class CartModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get totalItems => _items.values.fold(0, (sum, e) => sum + e.qty);

  double get totalPrice =>
      _items.values.fold(0, (sum, e) => sum + (e.product.price * e.qty));

  void add(Product product) {
    final existing = _items[product.id];
    if (existing == null) {
      _items[product.id] = CartItem(product: product, qty: 1);
    } else {
      existing.qty += 1;
    }
    notifyListeners();
  }

  void removeOne(String productId) {
    final existing = _items[productId];
    if (existing == null) return;

    if (existing.qty <= 1) {
      _items.remove(productId);
    } else {
      existing.qty -= 1;
    }
    notifyListeners();
  }

  void removeAll(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
