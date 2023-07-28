import 'package:dayofday/components/date_extension.dart';
import 'package:dayofday/components/special_days.dart';
import 'package:dayofday/widgets/box_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../../components/colors_app.dart';
import '../../components/constanta.dart';
import '../../models/calendar_date.dart';
import '../../presentations/calendar/calendar_notifier.dart';
import '../../widgets/dot_item_date_widget.dart';
import '_text_description_widget.dart';

part '_large_content_widget.dart';

part '_mobile_content_widget.dart';

part '_title_widget.dart';

part '_mobile_large_content_widget.dart';

enum ScreenPage { desktop, mobileLarge, mobileMedium, mobileSmall }

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var screenPageType = ScreenPage.mobileSmall;

          if (constraints.maxWidth >= 768) {
            screenPageType = ScreenPage.desktop;
          } else if (constraints.maxWidth >= 425) {
            screenPageType = ScreenPage.mobileLarge;
          } else if (constraints.maxWidth >= 375) {
            screenPageType = ScreenPage.mobileMedium;
          }
          return AdaptiveScreenContent(screenPage: screenPageType);
        },
      ),
    );
  }
}

class AdaptiveScreenContent extends StatefulWidget {
  const AdaptiveScreenContent({
    super.key,
    this.screenPage = ScreenPage.desktop,
  });

  final ScreenPage screenPage;

  @override
  State<AdaptiveScreenContent> createState() => _AdaptiveScreenContentState();
}

class _AdaptiveScreenContentState extends State<AdaptiveScreenContent> {
  late ScreenPage _screenPage;
  late final CalendarNotifier _calendarNotifier;

  @override
  void initState() {
    super.initState();
    _screenPage = widget.screenPage;
    _calendarNotifier = CalendarNotifier.create()..onCreateCalendar();
  }

  @override
  void didUpdateWidget(covariant AdaptiveScreenContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.screenPage != widget.screenPage) {
      setState(() {
        _screenPage = widget.screenPage;
      });
    }
  }

  @override
  void dispose() {
    _calendarNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_screenPage == ScreenPage.desktop) {
      return _LargeContentWidget(
        child: Builder(
          builder: (subContext) {
            final items = _calendarNotifier.reactiveValue(subContext);

            return SliverGrid.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 42,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) => DotItemDateWidget(
                title: items[index].title,
                isCircle: !items[index].isSpecialDay,
                colorBox: colorDot(items[index]),
                note: note(items[index]),
              ),
            );
          },
        ),
      );
    } else if (_screenPage == ScreenPage.mobileLarge) {
      return _MobileLargeContentWidget(
        child: Builder(
          builder: (subContext) {
            final items = _calendarNotifier.reactiveValue(subContext);

            return SliverGrid.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 23,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) => DotItemDateWidget(
                title: items[index].title,
                isCircle: !items[index].isSpecialDay,
                colorBox: colorDot(items[index]),
                note: note(items[index]),
              ),
            );
          },
        ),
      );
    }

    return _MobileContentWidget(
      child: Builder(
        builder: (subContext) {
          final items = _calendarNotifier.reactiveValue(subContext);

          return SliverGrid.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 20,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) =>DotItemDateWidget(
              title: items[index].title,
              isCircle: !items[index].isSpecialDay,
              colorBox: colorDot(items[index]),
              note: note(items[index]),
            ),
          );
        },
      ),
    );
  }

  String? note(CalendarDate calendarDate) {
    if (calendarDate.isToday) {
      return 'Today';
    } else if (calendarDate.isPast) {
      return isPastDay(calendarDate);
    }
    return null;
  }

  String? isPastDay(CalendarDate calendarDate) {
    if (specialDays.containsKey(calendarDate.dateTime)) {
      return specialDays[calendarDate.dateTime];
    } else if (calendarDate.isSpecialDay) {
      return '${calendarDate.dateTime.calculateAge} Birthday';
    }

    return null;
  }

  Color colorDot(CalendarDate calendarDate) {
    if (calendarDate.isSpecialDay) {
      return blackDotColor;
    } else if (calendarDate.isToday) {
      return todayDotColor;
    } else if (calendarDate.isPast) {
      return colorDotGrey;
    }

    return colorDotDefault;
  }
}
