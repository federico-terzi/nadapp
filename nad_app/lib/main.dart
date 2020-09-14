import 'package:flutter/material.dart';
import 'package:nad_app/middleware/logger_middleware.dart';
import 'package:nad_app/middleware/login_middleware.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/reducers/root_reducer.dart';
import 'package:nad_app/theme/style.dart';
import 'package:flutter/rendering.dart';

import 'routes.dart';

void main() {
  // TODO: read from preferences if the user is logged in
  final store = Store<AppState>(rootReducer,
      initialState: AppState(),
      middleware: [loggerMiddleware, loginMiddleware]);

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
        title: 'NAD-APP',
        theme: appTheme(),
        initialRoute: "/intro",
        onGenerateRoute: routeFactory,
      ),
    );
  }
}
