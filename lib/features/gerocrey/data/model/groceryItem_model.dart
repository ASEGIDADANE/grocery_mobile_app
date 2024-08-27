// import 'package:gerocries_app/features/gerocrey/data/model/groceryoption_model.dart';
// import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';

// class GroceryItemModel {
//   final String id;
//   final String title;
//   final String imageUrl;
//   final double rating;
//   final double price;
//   final double discount;
//   final String description;
//   final List<GroceryOptionModel> options;

//   GroceryItemModel({
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.rating,
//     required this.price,
//     required this.discount,
//     required this.description,
//     required this.options,
//   });

//   // Convert raw data from the API to GroceryItemModel
//   factory GroceryItemModel.fromJson(Map<String, dynamic> json) {
//     return GroceryItemModel(
//       id: json['id'],
//       title: json['title'],
//       imageUrl: json['imageUrl'],
//       rating: json['rating'].toDouble(),
//       price: json['price'].toDouble(),
//       discount: json['discount'].toDouble(),
//       description: json['description'],
//       options: (json['options'] as List)
//           .map((option) => GroceryOptionModel.fromJson(option))
//           .toList(),
//     );
//   }

//   // Convert GroceryItemModel to GroceryItem entity
//   GroceryItem toEntity() {
//     return GroceryItem(
//       id: id,
//       title: title,
//       imageUrl: imageUrl,
//       rating: rating,
//       price: price,
//       discount: discount,
//       description: description,
//       options: options.map((option) => option.toEntity()).toList(),
//     );
//   }
// }
import 'package:gerocries_app/features/gerocrey/data/model/groceryoption_model.dart';
import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';

class GroceryItemModel {
final String id;
final String title;
final String imageUrl;
final double rating;
final int price;
final int discount;
final String description;
final int reviewCount;
final List<GroceryOptionModel> options;

GroceryItemModel({
required this.id,
required this.title,
required this.imageUrl,
required this.rating,
required this.price,
required this.discount,
required this.description,
required this.reviewCount,
required this.options,
});

double get discountedPrice {
return price - (price * (discount / 100));
}

factory GroceryItemModel.fromJson(Map<String, dynamic> json) {
return GroceryItemModel(
id: json['id'],
title: json['title'],
imageUrl: json['imageUrl'],
rating: json['rating'].toDouble(),
price: json['price'],
discount: json['discount'],
description: json['description'],
reviewCount: json['reviewCount'] ?? 0,
options: (json['options'] as List)
.map((option) => GroceryOptionModel.fromJson(option))
.toList(),
);
}

GroceryItem toEntity() {
return GroceryItem(
id: id,
title: title,
imageUrl: imageUrl,
rating: rating,
price: price.toDouble(),
discount: discount.toDouble(),
description: description,
reviewCount: reviewCount,
options: options.map((option) => option.toEntity()).toList(),
);
}
}