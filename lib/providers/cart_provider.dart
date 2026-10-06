import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  double get total {
    double valorTotal = 0;

    for (Product produto in _cart) {
      valorTotal += produto.price;
    }

    return valorTotal;
  }

  void addProduct(Product produto) {
    _cart.add(produto);
    notifyListeners();
  }

  void removeProduct(Product produto) {
    _cart.remove(produto);
    notifyListeners();
  }
}
