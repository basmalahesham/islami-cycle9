import 'package:flutter/material.dart';

class SuraTitleHeaderWidget extends StatelessWidget {
  const SuraTitleHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Divider(
          color: theme.canvasColor,
          thickness: 2,
          // height: 0,  // عشان لو حبيت اشيل المسافة بين الديفيدر والكونتينر
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                'رقم السورة',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Container(
              width: 2,
              height: 40,
              color: theme.canvasColor,
            ),
            Expanded(
              child: Text(
                'اسم السورة',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        Divider(
          color: theme.canvasColor,
          thickness: 2,
        ),
      ],
    );
  }
}
