import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/actions/app_actions.dart';
import 'package:nad_app/db/db.dart';
import 'package:nad_app/init.dart';
import 'package:nad_app/middleware/logger_middleware.dart';
import 'package:nad_app/middleware/login_middleware.dart';
import 'package:nad_app/middleware/navigation_middleware.dart';
import 'package:nad_app/middleware/preferences_middleware.dart';
import 'package:nad_app/middleware/sync_middleware.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/reducers/root_reducer.dart';
import 'package:nad_app/theme/style.dart';
import 'package:redux/redux.dart';
import 'package:sqflite/sqflite.dart';

import 'actions/sync_actions.dart';
import 'middleware/sql_middleware.dart';
import 'models/meal.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  Jiffy.locale("it");


  final db = NadDatabase();

  final store = Store<AppState>(rootReducer,
      initialState: AppState(),
      middleware: [
        loggerMiddleware,
        loginMiddleware,
        navigationMiddleware,
        createSqlMiddleware(db),
        preferencesMiddleware,
        syncMiddleware,
      ]);

  runApp(NadApp(store: store));

  // Load the initial state at startup
  initializeState(db).then((state) {
    store.dispatch(AppInitialized(state: state));

    if (state.auth.sessionToken != null) {
      store.dispatch(RequestSync());
    }
  });
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
        initialRoute: "/init",
        onGenerateRoute: routeFactory,
      ),
    );
  }
}
