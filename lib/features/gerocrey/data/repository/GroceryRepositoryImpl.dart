import 'package:gerocries_app/features/gerocrey/data/data_source/GroceryRemoteDataSource.dart';
import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';
import 'package:gerocries_app/features/gerocrey/domain/repository/grocery_repository.dart';

class GroceryRepositoryImpl implements GroceryRepository {
  final GroceryRemoteDataSource remoteDataSource;

  GroceryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<GroceryItem>> getGroceries() async {
    final groceryModels = await remoteDataSource.getGroceries();
    return groceryModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<GroceryItem> getGroceryItemById(String id) async {
    final groceryModel = await remoteDataSource.getGroceryItemById(id);
    return groceryModel.toEntity();
  }
}
