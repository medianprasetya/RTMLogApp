import 'package:get/get.dart';
import 'package:logtemp/controllers/list_detail_homec.dart';

class HomeDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController());
    Get.lazyPut(() => HomeDetailController());
  }
}
