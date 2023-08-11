import 'package:flutter/material.dart';

class VersesWidgets extends StatelessWidget {
  String content;
  int index;

  VersesWidgets({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: Text(
        '$content($index)',
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
