import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'item.dart';

class ItemListProvider extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;
}
