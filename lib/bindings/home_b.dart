import 'package:get/get.dart';
import 'package:logtemp/controllers/homec.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController());
    Get.lazyPut(() => HomeController());
  }
}
