import 'package:get/get.dart';
import 'package:logtemp/component/home_menu_detail.dart';
import 'package:logtemp/page/home_page.dart';
import 'package:logtemp/page/splash_page.dart';
import 'route_name.dart';

class AppPage {
  static final allpages = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.homedetailpage,
      page: () => const HomeDetailPage(),
    ),
    GetPage(
      name: RouteName.homepage,
      page: () => const HomePage(),
    ),
  ];
}
