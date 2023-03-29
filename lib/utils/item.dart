class Item {
  String name;
  String description;
  double price;
  int quantity;
  int availableQuantity;

  Item(
      {required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.availableQuantity});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'availableQuantity': availableQuantity,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      availableQuantity: json['availableQuantity'],
    );
  }

  bool checkQuantity() {
    if (quantity + 1 <= availableQuantity) {
      return true;
    } else {
      return false;
    }
  }
}
