// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:logtemp/model/profile_detail.dart';

// class ProfileDetailController extends GetxController
//     with StateMixin<ProfileDetail> {
//   var deviceID = Get.arguments;

//   @override
//   void onInit() {
//     super.onInit();
//     getDataProfile(deviceID); // Panggil metode langsung
//   }

//   Future<void> getDataProfile(String? deviceID) async {
//     try {
//       final response = await GetConnect().get(
//         'https://odc.mpdev.my.id/dashboard/detail-device?pDeviceID=$deviceID',
//       );

//       if (response.statusCode == 200) {
//         final responseJson = json.encode(response.body['data']['deviceData']);
//         final data = ProfileDetail.fromJson(json.decode(responseJson));
//         // print(jsonEncode(data));
//         change(data, status: RxStatus.success());
//       } else {
//         // Tangani kesalahan API (misalnya, lempar pengecualian)
//         throw Exception(
//             'Gagal mengambil detail $deviceID. Kode: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Tangani kesalahan koneksi atau parsing
//       // print('Terjadi kesalahane: $e');
//       change(null,
//           status: RxStatus.error('Terjadi kesalahan: ${e.toString()}'));
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:logtemp/model/profile_detail.dart';

class ProfileDetailController extends GetxController
    with StateMixin<ProfileDetail> {
  var deviceID = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getDataProfile(deviceID); // Panggil metode langsung
    getLatestData(deviceID); // Panggil metode langsung
  }

  Future getLatestData(String? deviceID) async {
    try {
      final responselatestdata = await GetConnect().get(
        'https://odc.mpdev.my.id/dashboard/latest-data?pDeviceId=$deviceID',
      );

      if (responselatestdata.statusCode == 200) {
        final Map<String, dynamic> res = responselatestdata.body;
        final Map<String, dynamic> latestData = res['data']['grafikData'];

        final data = ProfileDetail.fromJson(latestData);
        // print(data.toJson()); // Print data dalam bentuk Map
        // print(res);
        // print(data);

        change(data, status: RxStatus.success());
      } else {
        throw Exception(
            'Gagal mengambil Data profil. Kode: ${responselatestdata.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      change(null,
          status: RxStatus.error('Terjadi kesalahan: ${e.toString()}'));
    }
  }

  Future<void> getDataProfile(String? deviceID) async {
    try {
      final response = await GetConnect().get(
        'https://odc.mpdev.my.id/dashboard/detail-device?pDeviceID=$deviceID',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.body;
        final Map<String, dynamic> deviceData =
            responseData['data']['deviceData'];

        final data = ProfileDetail.fromJson(deviceData);
        // print(data.toJson()); // Print data dalam bentuk Map
        // print(deviceData.length);
        change(data, status: RxStatus.success());
      } else {
        throw Exception(
            'Gagal mengambil detail profil. Kode: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      change(null,
          status: RxStatus.error('Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
