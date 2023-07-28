import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';

class DotItemDateWidget extends StatelessWidget {
  const DotItemDateWidget({
    super.key,
    required this.title,
    this.isCircle = false,
    this.colorBox = const Color(0xffEEEEEE),
    this.note,
    this.urlLink,
  });

  final bool isCircle;
  final Color colorBox;
  final String title;
  final String? note;
  final String? urlLink;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return InfoPopupWidget(
      arrowTheme: const InfoPopupArrowTheme(
        arrowDirection: ArrowDirection.down,
      ),
      customContent: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: theme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (note != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(note!, style: theme.bodySmall),
              ),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: colorBox,
        ),
      ),
    );
  }
}
