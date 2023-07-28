
import 'package:dayofday/models/calendar_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calendar Date Group Model', () {
    test('Test Create CalendarDate Model DateTime Now', () {
      final calendarDate = CalendarDate.create(date: DateTime.now());
      expect(calendarDate.isToday, true);
    });

    test('Test Create CalendarDate Model with BirthDay', () {
      final birthDate = CalendarDate.create(date: DateTime(2023, 01, 13));
      expect(birthDate.isBirthDay, true);
      expect(birthDate.isToday, false);
    });

    test('Test Create CalendarDate Model with PastDay', () {
      final pastDate = CalendarDate.create(
        date: DateTime.now().subtract(const Duration(days: 10)),
      );
      expect(pastDate.isPast, true);
      expect(pastDate.isToday, false);
      expect(pastDate.isBirthDay, false);
    });
  });
}
