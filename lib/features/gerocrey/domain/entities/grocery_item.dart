import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_option.dart';

class GroceryItem {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<GroceryOption> options;

  GroceryItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options, required int reviewCount,
  });

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      description: json['description'],
      options: (json['options'] as List).map((option) => GroceryOption.fromJson(option)).toList(), reviewCount: json['reviewCount'] ?? 0 ,
    );
  }
}