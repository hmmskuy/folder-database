import 'package:database_2/pages/home_page.dart';
import 'package:database_2/theme/app_theme.dart';
// import 'package:database_semester2/database_in.dart';
// import 'package:database_semester2/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: isDark ? AppTheme.dark : AppTheme.light,
      // home: AnimatedSplashScreen(
      //   duration: 3000,
      //   splash: Lottie.asset('assets/download.json'),
      //   nextScreen: HomePage(onToggleTheme: toggleTheme),
      //   splashTransition: SplashTransition.fadeTransition,
      //   splashIconSize: 150,
      //   backgroundColor: Colors.white,
      // ),
      home: HomePage(onToggleTheme: toggleTheme),
    );
  }
}
