import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';
import 'package:gerocries_app/features/gerocrey/domain/repository/grocery_repository.dart';

class GetGroceries {
  final GroceryRepository repository;

  GetGroceries(this.repository, {required Object GroceryRepository});

  Future<List<GroceryItem>> call() async {
    return await repository.getGroceries();
  }
}
