import 'package:get/get.dart';
import 'package:logtemp/model/latest_measurement.dart';

class LatestMeasurementController extends GetxController
    with StateMixin<LatestMeasurement> {
  var deviceID = Get.arguments;
  RxString latestMeasurementDt = "0".obs;
  late String latestMeasurementDtDate;

  @override
  void onInit() {
    super.onInit();
    getLatestMeasurement(deviceID);
  }

  Future<void> getLatestMeasurement(String? deviceID) async {
    try {
      final response = await GetConnect().get(
        'https://odc.mpdev.my.id/dashboard/latest-data?pDeviceId=$deviceID',
      );

      final Map<String, dynamic> responseData =
          response.body['data']['grafikData'];
      final data = LatestMeasurement.fromJson(responseData);

      latestMeasurementDt.value = data.measuringValue ?? "0";
      latestMeasurementDtDate = data.timeOnly.toString();

      change(data, status: RxStatus.success());
    } catch (e) {
      print('Terjadi kesalahan: $e');
      change(null,
          status: RxStatus.error('Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
