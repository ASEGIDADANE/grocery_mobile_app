class GroceryOption {
  final String id;
  final String name;
  final double price;

  GroceryOption({
    required this.id,
    required this.name,
    required this.price,
  });

  factory GroceryOption.fromJson(Map<String, dynamic> json) {
    return GroceryOption(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
}