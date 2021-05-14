import 'package:flutter/material.dart';
import 'package:flutter_demo/models/item.dart';

class CartModel extends ChangeNotifier {
  final List<Item> listItem = [];

  double get totalPrice => listItem.fold(0, (previousValue, element) => previousValue + element.price * element.count);

  void add(Item item) {
    listItem.add(item);
    notifyListeners();
  }
}
