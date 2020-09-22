import 'package:flutter/cupertino.dart';
import 'package:nad_app/models/app_state.dart';

@immutable
class AppInitialized {
  final AppState state;

  AppInitialized({this.state});
}