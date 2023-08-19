import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/settings_provider.dart';

class VersesWidgets extends StatelessWidget {
  String content;
  int index;

  VersesWidgets({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
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
          color: provider.currentTheme != ThemeMode.dark
              ? Colors.black
              : theme.canvasColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
