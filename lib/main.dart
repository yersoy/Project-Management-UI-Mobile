import 'package:cilekhavuz/pages/login_auth.dart';
import 'package:cilekhavuz/pages/main.dart';
import 'package:cilekhavuz/pages/project/project.dart';
import 'package:cilekhavuz/pages/splash.dart';
import 'package:cilekhavuz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Titles.APP_TITLE,
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: GoogleFonts.quicksandTextTheme()),
      home: const Splash(),
      routes: {
        Routes.SPLASH: (context) => const Splash(),
        Routes.AUTHENTICATION: (context) => const LoginAuth(),
        Routes.DASHBOARD: (context) => const MainPage(),
        Routes.PROJECTS: (context) => const Project(),
      },
    );
  }
}
