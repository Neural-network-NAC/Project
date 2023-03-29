import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'item.dart';

class ItemListProvider extends ChangeNotifier {
  List<Item> items = [];

  void addItem(Item item) {
    for (Item x in items) {
      if (x.name == item.name && x.description == item.description) {
        return;
      }
    }
    items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    for (Item x in items) {
      if (x.name == item.name && x.description == item.description) {
        items.remove(x);
        notifyListeners();
        break;
      }
    }
  }

  int findIndexByName(Item item) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].name == item.name) {
        return i;
      }
    }
    return -1;
  }
}
