import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/middleware/logger_middleware.dart';
import 'package:nad_app/middleware/login_middleware.dart';
import 'package:nad_app/middleware/navigation_middleware.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/reducers/root_reducer.dart';
import 'package:nad_app/theme/style.dart';
import 'package:flutter/rendering.dart';
import 'middleware/persistence_middleware.dart';
import 'models/meal.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final initialState = AppState(meal: MealState(meals: [
  Meal(date: DateTime.now(), meal: "3 fette biscottate con una tazza di latte\n20 grammi di marmellata di prugne"),
  Meal(date: Jiffy().subtract(days: 10).toLocal(), meal: "3 fette biscottate con una tazza di latte\n20 grammi di marmellata di prugne")
]));

void main() {
  Jiffy.locale("it");
  // TODO: read from preferences if the user is logged in
  final store =
      Store<AppState>(rootReducer, initialState: initialState, middleware: [
    loggerMiddleware,
    loginMiddleware,
    navigationMiddleware,
    persistenceMiddleware
  ]);

  runApp(NadApp(store: store));
}

class NadApp extends StatelessWidget {
  final Store<AppState> store;

  NadApp({this.store});

  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'NAD-APP',
        theme: appTheme(),
        initialRoute: "/intro",
        onGenerateRoute: routeFactory,
      ),
    );
  }
}
