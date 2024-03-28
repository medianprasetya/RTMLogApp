import 'package:flutter/material.dart';
import 'package:logtemp/bindings/home_b.dart';
import 'package:logtemp/controllers/latest_measurementc.dart';
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
    // Get.put(HomeController());
    Get.put(LatestMeasurementController());
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      // darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialBinding: HomeBinding(),
      // routes: {
      //   HomePage.routeName: (context) => const HomePage(),
      //   HomeDetailPage.routeName: (context) => const HomeDetailPage(),
      //   SplashScreen.routeName: (context) => const SplashScreen(),
      // }
      getPages: AppPage.allpages,
    );
  }
}
