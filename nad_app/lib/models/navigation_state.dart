import 'package:meta/meta.dart';

import 'package:nad_app/models/user.dart';

@immutable
class NavigationState {
  final String redirectTo;

  NavigationState({
    this.redirectTo
  });

  NavigationState copyWith({
    String redirectTo
  }) {
    return new NavigationState(
      redirectTo: redirectTo ?? this.redirectTo,
    );
  }
}