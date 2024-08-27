// // import 'package:flutter/material.dart';
// // import 'package:gerocries_app/features/gerocrey/presentation/pages/grocery_detail_page.dart';

// import 'package:flutter/material.dart';
// import 'package:gerocries_app/features/gerocrey/presentation/pages/grocery_detail_page.dart';

// // import 'package:gerocries_app/features/gerocrey/presentation/pages/grocery_option_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Web App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GroceryItemWidget(), // Set your main screen here
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerocries_app/dependency_injection.dart';

import 'package:gerocries_app/features/gerocrey/presentation/bloc/grocery_bloc.dart';
import 'package:gerocries_app/features/gerocrey/presentation/pages/grocery_detail_page.dart';
import 'package:gerocries_app/features/gerocrey/presentation/pages/grocery_option_page.dart';
import 'package:gerocries_app/features/gerocrey/presentation/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<BurgerBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _generateRoute,
        initialRoute: "/",
        title: 'Groceries App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
          // useMaterial3: true, // This line is commented out as useMaterial3 is not a property in ThemeData
        ),
      ),
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/home_page":
        return MaterialPageRoute(builder: (_) => GroceryScreen());
      case "/detail_page":
        final product = settings.arguments;
        if (product is GroceryItem) {
          return MaterialPageRoute(
            builder: (_) => DetailPage(product: product),
          );
        }
        return null;
      default:
        return null;
    }
  }
}