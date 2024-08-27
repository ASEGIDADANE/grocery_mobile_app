// import 'package:gerocries_app/features/gerocrey/data/repository/GroceryRepositoryImpl.dart';
// import 'package:gerocries_app/features/gerocrey/domain/use_case/get_groceries_usecase.dart';
// import 'package:gerocries_app/features/gerocrey/presentation/bloc/grocery_bloc.dart';
// import 'package:get_it/get_it.dart';


// // import 'package:gerocries_app/features/gerocrey/domain/repository/grocery_repository.dart';


// // final GetIt sl = GetIt.instance;

// // void setupDependencyInjection() {
// //   // Registering repositories
// //   sl.registerLazySingleton<GroceryRepository>(() => GroceryRepositoryImpl() );

// //   // Registering use cases
// //   sl.registerLazySingleton(() => GetGroceries(sl<GroceryRepository>()));

// //   // Registering blocs
// //   sl.registerFactory(() => BurgerBloc(GetGroceries: sl()));
// // }



// import 'package:gerocries_app/features/gerocrey/data/data_source/GroceryRemoteDataSource.dart';
// import 'package:gerocries_app/features/gerocrey/data/repository/GroceryRepositoryImpl.dart';
// import 'package:gerocries_app/features/gerocrey/domain/repository/grocery_repository.dart';
// import 'package:gerocries_app/features/gerocrey/domain/use_case/get_groceries_usecase.dart';
// import 'package:gerocries_app/features/gerocrey/domain/use_case/get_grocery_itemdetails_usecase.dart';
// import 'package:gerocries_app/features/gerocrey/presentation/bloc/grocery_bloc.dart';
// import 'package:get_it/get_it.dart';


// final locator = GetIt.instance;
// Future<void> setupLocator() async {
//   locator.registerFactory(() => BurgerBloc(locator(), locator()));

//   // usecases
//   locator.registerLazySingleton(
//       () => GetGroceryItemDetails(GroceryRepository: locator()));

//   locator.registerLazySingleton(
//       () => GetGroceries(GroceryRepository: locator()));

//   // repository
//   locator.registerLazySingleton<GroceryRepository>(
//     () => GroceryRepositoryImpl(
//       GroceryRemoteDataSource: locator(),
//     ),
//   );

//   // data source
//   locator.registerLazySingleton<GroceryRemoteDataSource>(
//     () => GroceryRemoteDataSource(
//       client: locator(),
//     ),
//   );

//   // external

//   locator.registerLazySingleton(() => http.Client());
// }

// class GetGroceries {
// }
import 'package:gerocries_app/features/gerocrey/data/data_source/GroceryRemoteDataSource.dart';
import 'package:gerocries_app/features/gerocrey/data/repository/GroceryRepositoryImpl.dart';
import 'package:gerocries_app/features/gerocrey/domain/repository/grocery_repository.dart';
import 'package:gerocries_app/features/gerocrey/domain/use_case/get_groceries_usecase.dart';
import 'package:gerocries_app/features/gerocrey/domain/use_case/get_grocery_itemdetails_usecase.dart';
import 'package:gerocries_app/features/gerocrey/presentation/bloc/grocery_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(() => BurgerBloc(locator(), locator(), GetGroceries: null, getGroceriesUseCase: null));

  // use cases
  locator.registerLazySingleton(() => GetGroceryItemDetails(GroceryRepository: locator()));

  locator.registerLazySingleton(() => GetGroceries(groceryRepository: locator()));

  // repository
  locator.registerLazySingleton<GroceryRepository>(
    () => GroceryRepositoryImpl(
      groceryRemoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<GroceryRemoteDataSource>(
    () => GroceryRemoteDataSource(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}