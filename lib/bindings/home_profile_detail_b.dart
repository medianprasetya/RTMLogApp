import 'package:get/get.dart';
import 'package:logtemp/controllers/profile_detailc.dart';

class ProfileDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController());
    Get.lazyPut(() => ProfileDetailController());
  }
}
