import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {

  String get asFullDate {
    return DateFormat('dd MMMM yyyy').format(this);
  }
}