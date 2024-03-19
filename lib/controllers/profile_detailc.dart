import 'dart:convert';

import 'package:get/get.dart';
import 'package:logtemp/model/profile_detail.dart';

class ProfileDetailController extends GetxController
    with StateMixin<ProfileDetail> {
  var deviceID = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getDataProfile(deviceID); // Panggil metode langsung
  }

  Future<void> getDataProfile(String? deviceID) async {
    try {
      final response = await GetConnect().get(
        'https://odc.mpdev.my.id/dashboard/detail-device?pDeviceID=$deviceID',
      );

      if (response.statusCode == 200) {
        final responseJson = json.encode(response.body['data']['deviceData']);
        final data = ProfileDetail.fromJson(json.decode(responseJson));
        print(jsonEncode(data));
        change(data, status: RxStatus.success());
      } else {
        // Tangani kesalahan API (misalnya, lempar pengecualian)
        throw Exception(
            'Gagal mengambil detail profil. Kode: ${response.statusCode}');
      }
    } catch (e) {
      // Tangani kesalahan koneksi atau parsing
      print('Terjadi kesalahane: $e');
      change(null,
          status: RxStatus.error('Terjadi kesalahan: ${e.toString()}'));
    }
  }
}

// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:logtemp/model/profile_detail.dart';

// class ProfileDetailController extends GetxController
//     with StateMixin<ProfileDetail> {
//   var deviceID = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Perhatikan bahwa Anda tidak perlu menggunakan .obs pada deviceID di sini
//     deviceID.value =
//         Get.arguments; // Perbarui nilai deviceID dengan argumen yang diterima
//     getDataProfile(); // Panggil metode langsung
//     print(deviceID);
//   }

//   Future<void> getDataProfile() async {
//     try {
//       final response = await GetConnect().get(
//         'https://odc.mpdev.my.id/dashboard/detail-device?pDeviceID=${deviceID.value}',
//       );
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         if (responseData != null &&
//             responseData['data'] != null &&
//             responseData['data']['deviceData'] != null) {
//           final data =
//               ProfileDetail.fromJson(responseData['data']['deviceData']);
//           change(data, status: RxStatus.success());
//         } else {
//           throw Exception('Data tidak tersedia atau tidak lengkap');
//         }
//       } else {
//         throw Exception(
//             'Gagal mengambil detail profil. Kode: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Terjadi kesalahan: $e');
//       change(null,
//           status: RxStatus.error('Terjadi kesalahan: ${e.toString()}'));
//     }
//   }
// }
