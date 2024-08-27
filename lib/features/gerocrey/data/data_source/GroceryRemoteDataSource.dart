
import 'dart:convert';

import 'package:gerocries_app/features/gerocrey/data/model/groceryItem_model.dart';
import 'package:http/http.dart' as http;



abstract class GroceryRemoteDataSource {
  Future<List<GroceryItemModel>> getGroceries();
  Future<GroceryItemModel> getGroceryItemById(String id);
}

class GroceryRemoteDataSourceImpl implements GroceryRemoteDataSource {
  final http.Client client;

  GroceryRemoteDataSourceImpl(this.client);

  @override
  Future<List<GroceryItemModel>> getGroceries() async {
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((item) => GroceryItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load groceries');
    }
  }

  @override
  Future<GroceryItemModel> getGroceryItemById(String id) async {
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/$id'),
    );

    if (response.statusCode == 200) {
      return GroceryItemModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load grocery item');
    }
  }
}
