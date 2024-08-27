import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';
import 'package:gerocries_app/features/gerocrey/domain/repository/grocery_repository.dart';

class GetGroceryItemDetails {
  final GroceryRepository repository;

  GetGroceryItemDetails(this.repository, {required Object productRepository, required Object GroceryRepository});

  Future<GroceryItem> call(String id) async {
    return await repository.getGroceryItemById(id);
  }
}
