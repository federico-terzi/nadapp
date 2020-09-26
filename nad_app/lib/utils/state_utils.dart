import 'package:quiver/core.dart';

T reduceState<T>(Optional<T> optional, T previous) {
  if (optional == null) {
    return previous;
  } else {
    if (optional.isPresent) {
      return optional.value;
    } else {
      return null;
    }
  }
}