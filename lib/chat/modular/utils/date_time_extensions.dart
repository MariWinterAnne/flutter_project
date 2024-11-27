import 'package:intl/intl.dart';

getDateTime(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('yyyy').format(date);
}
