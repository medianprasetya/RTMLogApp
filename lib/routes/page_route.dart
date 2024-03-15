import 'package:get/get.dart';
import 'package:logtemp/bindings/home_b.dart';
import 'package:logtemp/page/home_detail_page.dart';
import 'package:logtemp/page/home_page.dart';
import 'package:logtemp/page/information.dart';
import 'package:logtemp/page/splash_page.dart';
import 'route_name.dart';

class AppPage {
  static final allpages = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      // ignore: prefer_interpolation_to_compose_strings
      // name: RouteName.homedetailpage + '/:parameter?',
      name: '${RouteName.homedetailpage}/?',
      page: () => const HomeDetailPage(),
    ),
    GetPage(
        name: RouteName.homepage,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
      name: RouteName.information,
      page: () => const Information(),
    ),
  ];
}
