import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';

abstract class GroceryRepository {
  Future<List<GroceryItem>> getGroceries();
  Future<GroceryItem> getGroceryItemById(String id);
}
