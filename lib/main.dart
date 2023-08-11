import 'package:flutter/material.dart';
import 'package:islami/core/style/app_theme.dart';
import 'package:islami/layout/home_layout.dart';
import 'package:islami/moduls/hadeth/hadeth_details.dart';
import 'package:islami/moduls/quran/sura_details_view.dart';
import 'package:islami/moduls/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeLayout.routeName: (context) => HomeLayout(),
        SuraDetailsView.routeName: (context) => SuraDetailsView(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}
