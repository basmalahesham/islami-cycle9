import 'package:flutter/material.dart';
import 'package:islami/moduls/hadeth/hadeth_view.dart';

import '../../core/style/app_theme.dart';

class HadethDetails extends StatelessWidget {
  const HadethDetails({super.key});

  static const String routeName = 'hadeth_detail';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)!.settings.arguments as HadethData;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppTheme.themeMode != ThemeMode.dark
                  ? 'assets/images/default_bg.png'
                  : 'assets/images/dark_bg.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Islami'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(
            top: 15,
            bottom: 80,
            left: 30,
            right: 30,
          ),
          padding: EdgeInsets.only(
            top: 40,
          ),
          decoration: BoxDecoration(
            color: AppTheme.themeMode != ThemeMode.dark
                ? const Color(0xFFF8F8F8).withOpacity(0.75)
                : const Color(0xFF141A2E).withOpacity(0.75),
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args.title,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: AppTheme.themeMode != ThemeMode.dark
                            ? Colors.black
                            : theme.canvasColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.play_circle,
                      color: AppTheme.themeMode != ThemeMode.dark
                          ? Colors.black
                          : theme.canvasColor,
                    ),
                  ],
                ),
                Divider(
                  color: theme.canvasColor,
                  thickness: 1.5,
                  indent: 40,
                  endIndent: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Text(
                    args.content,
                    textDirection: TextDirection.rtl,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.themeMode != ThemeMode.dark
                          ? Colors.black
                          : theme.canvasColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
