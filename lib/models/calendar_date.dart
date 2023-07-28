import 'package:dayofday/components/date_extension.dart';

class CalendarDate {
  final bool isToday;
  final bool isSpecialDay;
  final DateTime dateTime;
  final bool isPast;
  final String title;
  final String? note;

  CalendarDate({
    required this.dateTime,
    required this.title,
    this.isToday = false,
    this.isSpecialDay = false,
    this.isPast = false,
    this.note,
  });

  factory CalendarDate.create({
    required DateTime date,
    required String title,
    String? note,
  }) =>
      CalendarDate(
        title: title,
        dateTime: date,
        isToday: date.isToday,
        isSpecialDay: date.isBirthDay,
        isPast: date.isPast,
        note: note,
      );
}
