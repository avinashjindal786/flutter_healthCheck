import 'dart:developer';

import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> get cart => _cart;

  addedToCart(Map<String, dynamic> data) {
    _cart.add(data);
    debugPrint(_cart.toString());
    notifyListeners();
  }

  removeToCart(Map<String, dynamic> data) {
    _cart.remove(data);
    notifyListeners();
  }

  clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
