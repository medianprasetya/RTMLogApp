import 'package:get/get.dart';
import 'package:logtemp/model/profile_detail.dart';

class ProfileDetailController extends GetxController
    with StateMixin<List<ProfileDetail>> {
  // Remove the unnecessary 'get controller => null;' line

  // final deviceID = Get.arguments;
  final String deviceID = '99';
  @override
  void onInit() {
    super.onInit();
    getDataListHome(deviceID); // Call the method directly
  }

  Future<void> getDataListHome(String deviceID) async {
    final response = await GetConnect().get(
        'https://odc.mpdev.my.id/dashboard/detail-device?pDeviceID=$deviceID');
    print(response);
    // if (response.status.isOk) {
    //   final data = List<ProfileDetail>.from((response.body['data'] as List)
    //       .map((e) => ProfileDetail.fromJson(e)));
    //   print(data);
    //   change(data, status: RxStatus.success());
    // } else {
    //   change(null, status: RxStatus.error('Gagal Memuat data'));
    //   // Consider adding more specific error handling here
    // }
  }
}
