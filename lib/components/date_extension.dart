extension DateTimeValidation on DateTime {
  bool get isToday {
    final dateNow = DateTime.now();
    return day == dateNow.day && month == dateNow.month && year == dateNow.year;
  }

  bool get isPast => difference(DateTime.now()).isNegative;

  bool get isBirthDay {
    final isBirthDayDate = day == 1 && month == 2;
    return (isToday && isBirthDayDate) || (isPast && isBirthDayDate);
  }

  int get calculateAge => year - 1993;
}
