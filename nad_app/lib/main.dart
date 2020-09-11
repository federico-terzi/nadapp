import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

import 'routes.dart';

void main() {
  runApp(NadApp());
}

class NadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAD-APP',
      theme: appTheme(),
      initialRoute: "/intro",
      onGenerateRoute: routeFactory,
    );
  }
}