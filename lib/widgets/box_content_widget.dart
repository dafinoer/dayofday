import 'package:flutter/material.dart';

class BoxContentWidget extends StatelessWidget {
  const BoxContentWidget({
    super.key,
    required this.height,
    required this.width,
    this.child = const SizedBox.shrink(),
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: child,
      ),
    );
  }
}
