import 'package:jiffy/jiffy.dart';

String getFormattedDate(DateTime date) {
  var jiffyDate = Jiffy(date)..startOf(Units.MINUTE);
  return jiffyDate.fromNow().capitalize();
}

String getFullFormattedDate(DateTime date) {
  var jiffyDate = Jiffy(date)..startOf(Units.MINUTE);
  return "${jiffyDate.fromNow().capitalize()} (${jiffyDate.format("dd/MM/yyyy")})";
}

// TODO: add tests

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
