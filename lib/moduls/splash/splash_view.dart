import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/core/style/app_theme.dart';
import 'package:islami/layout/home_layout.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';

class SplashView extends StatelessWidget {
  static const String routeName = 'splash';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
    });
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.getMainSplash(),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
