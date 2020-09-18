import 'package:jiffy/jiffy.dart';

String getFormattedDate(DateTime date) {
  var jiffyDate = Jiffy(date)..startOf(Units.HOUR);
  return jiffyDate.fromNow().capitalize();
}

// TODO: add tests

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
