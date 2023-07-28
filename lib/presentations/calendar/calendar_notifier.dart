import 'package:dayofday/repositories/calendar_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../models/calendar_date.dart';

class CalendarNotifier extends ValueNotifier<List<CalendarDate>> {
  CalendarNotifier(super.value, this._calendarRepository);

  factory CalendarNotifier.create() => CalendarNotifier(
        const [],
        const CalendarRepository(),
      );

  final CalendarRepository _calendarRepository;
  final _dateBirth = DateTime(1993, 2, 1);
  final _endDate = DateTime(2058, 2, 1);

  void onCreateCalendar() {
    value = _calendarRepository.createDates(_dateBirth, _endDate);
  }
}
