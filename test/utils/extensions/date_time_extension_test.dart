import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:raw_games/utils/extensions/date_time_extension.dart';

void main() {
  group('Validate DateTimeExtension', () {
    test('Validate asFullDate() returns the correct format', () {
      final date = DateTime(2023, 5, 13);
      final formattedDate = DateFormat('dd MMMM yyyy').format(date);
      expect(date.asFullDate, formattedDate);
    });
  });
}
