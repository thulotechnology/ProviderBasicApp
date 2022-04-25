import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item {
  final int id;
  final String name;
  final double price;

  Item(this.id, this.name, this.price);
}

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }
}
