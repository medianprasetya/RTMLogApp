import 'package:flutter/material.dart';
import 'package:logtemp/page/home_detail_page.dart';
import 'page/splash_page.dart';
import 'page/home_page.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          HomeDetailPage.routeName: (context) => const HomeDetailPage(),
          SplashScreen.routeName: (context) => const SplashScreen(),
        });
  }
}
