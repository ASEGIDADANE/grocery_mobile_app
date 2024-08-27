import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_option.dart';

class GroceryOptionModel {
  final String id;
  final String name;
  final double price;

  GroceryOptionModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory GroceryOptionModel.fromJson(Map<String, dynamic> json) {
    return GroceryOptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }

  GroceryOption toEntity() {
    return GroceryOption(
      id: id,
      name: name,
      price: price,
    );
  }
}
