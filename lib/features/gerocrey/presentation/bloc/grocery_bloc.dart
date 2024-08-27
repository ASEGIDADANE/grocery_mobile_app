import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerocries_app/features/gerocrey/domain/entities/grocery_item.dart';
import 'package:gerocries_app/features/gerocrey/presentation/bloc/grocery_event.dart';
import 'package:gerocries_app/features/gerocrey/presentation/bloc/grocery_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BurgerBloc extends Bloc<BurgerEvent, BurgerState> {
  BurgerBloc({required Object GetGroceries, required getGroceriesUseCase}) : super(BurgerInitial());

  Stream<BurgerState> mapEventToState(BurgerEvent event) async* {
    if (event is LoadBurgers) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(BurgerLoading()); // Notify UI that data loading has started

      try {
        final burgers = await fetchBurgersFromAPI();
        // ignore: invalid_use_of_visible_for_testing_member
        emit(BurgerLoaded(burgers));
      } catch (e) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(GroceryError(message: 'Failed to load burgers'));
      }
    }
    // Add more event handling as needed
  }

  Future<List<GroceryItem>> fetchBurgersFromAPI() async {
    const url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'; // API endpoint for fetching burgers
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<GroceryItem> burgers = data['data'].map<GroceryItem>((json) => GroceryItem.fromJson(json)).toList();
      return burgers;
    } else {
      throw Exception('Failed to load burgers');
    }
  }
}