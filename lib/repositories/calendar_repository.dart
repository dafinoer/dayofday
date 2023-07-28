import 'package:intl/intl.dart';

import '../models/calendar_date.dart';

class CalendarRepository {
  const CalendarRepository();

  List<CalendarDate> createDates(DateTime dateBirth, DateTime endDate) {
    final eventsCalendar = <CalendarDate>[];
    final totalDays = endDate.difference(dateBirth).inDays;
    for (int indexDate = 0; indexDate < totalDays; indexDate++) {
      final dateResult = dateBirth.add(Duration(days: indexDate));
      final dateFormat = DateFormat.yMMMMd().format(dateResult);
      eventsCalendar.add(
        CalendarDate.create(date: dateResult, title: dateFormat),
      );
    }

    return eventsCalendar;
  }
}
