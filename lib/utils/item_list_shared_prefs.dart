import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'item.dart';

Future<void> saveItems(List<Item> items) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonItems = items.map((item) => jsonEncode(item.toJson())).toList();
  prefs.setStringList('items', jsonItems);
}

Future<List<Item>> getItems() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonItems = prefs.getStringList('items');
  if (jsonItems == null) {
    return [];
  }
  return jsonItems
      .map((jsonItem) => Item.fromJson(jsonDecode(jsonItem)))
      .toList();
}

Future<void> addItem(Item item) async {
  final items = await getItems();
  items.add(item);
  await saveItems(items);
}

Future<void> removeItem(int index) async {
  final items = await getItems();
  items.removeAt(index);
  await saveItems(items);
}

Future<void> updateItemQuantity(int index, int newQuantity) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> itemsString = prefs.getStringList('items') ?? [];

  if (index >= 0 && index < itemsString.length) {
    final Map<String, dynamic> itemsJson = jsonDecode(itemsString[index]);
    final Item item = Item.fromJson(itemsJson);

    if (newQuantity > item.availableQuantity) {
      // Do not update the quantity if it exceeds the available quantity
      return;
    }

    item.quantity = newQuantity;
    itemsString[index] = jsonEncode(item.toJson());
    prefs.setStringList('items', itemsString);
  }
}
