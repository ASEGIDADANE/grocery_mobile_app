import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';

abstract class BurgerState {}

class BurgerInitial extends BurgerState {}
class BurgerLoading extends BurgerState {}
class BurgerLoaded extends BurgerState {
  final List<GroceryItem> burgers;

  BurgerLoaded(this.burgers);
}
class GroceryError extends BurgerState {
  final String message;

  GroceryError({required this.message});
  
  // You can add any other properties or methods as needed
}
// Add more states as needed