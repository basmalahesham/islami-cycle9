import 'package:flutter/material.dart';

import '../../../core/style/app_theme.dart';

class VersesWidgets extends StatelessWidget {
  String content;
  int index;

  VersesWidgets({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: Text(
        '$content($index)',
        textDirection: TextDirection.rtl,
        style: theme.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: AppTheme.themeMode != ThemeMode.dark
              ? Colors.black
              : theme.canvasColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
