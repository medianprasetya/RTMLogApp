import 'package:flutter/material.dart';
import 'package:logtemp/routes/page_route.dart';
import 'page/home_page.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      // darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // routes: {
      //   HomePage.routeName: (context) => const HomePage(),
      //   HomeDetailPage.routeName: (context) => const HomeDetailPage(),
      //   SplashScreen.routeName: (context) => const SplashScreen(),
      // }
      getPages: AppPage.allpages,
    );
  }
}
