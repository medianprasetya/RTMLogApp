import 'package:get/get.dart';
import 'package:logtemp/model/homedetail.dart';

class HomeDetailController extends GetxController
    with StateMixin<List<ListDetailHome>> {
  // Remove the unnecessary 'get controller => null;' line

  final groupID = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    getDataListHome(groupID); // Call the method directly
  }

  Future<void> getDataListHome(String groupID) async {
    final response = await GetConnect()
        .get('https://odc.mpdev.my.id/dashboard/home?pGroupID=$groupID');
    if (response.status.isOk) {
      final data = List<ListDetailHome>.from(
          (response.body['data']['data'] as List)
              .map((e) => ListDetailHome.fromJson(e)));
      change(data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error('Gagal Memuat data'));
    }
  }
}
