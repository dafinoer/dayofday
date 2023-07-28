import 'package:flutter/material.dart';

import '../../components/constanta.dart';

class TextDescriptionWidget extends StatelessWidget {
  const TextDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Text(desc, style: theme.bodyLarge),
    );
  }
}
