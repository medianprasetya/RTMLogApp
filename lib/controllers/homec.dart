import 'package:get/get.dart';
import 'package:logtemp/model/home.dart';

// class HomeController extends GetxController with StateMixin<List<ListHome>> {
//   // with
//   //     StateMixin<String> {
// // 3, disini kita buat controllernya
//   // getAllCategories() {
//   //   // try {
//   //   HomeProvider().getCat().then((response) {
//   //     if (response.statusCode == 200) {
//   //       final data = response.body;
//   //       // const data = "data oke";
//   //       change(data, status: RxStatus.success());
//   //     }
//   //   }, onError: (e) {
//   //     change(null, status: RxStatus.error(e.toString()));
//   //   });
//   //   // } catch (e) {
//   //   //   change(null, status: RxStatus.error(e.toString()));
//   //   // }
//   // }
//   // final homeProvider HomeProvider;
//   // homeController({this.HomeController});

//   @override
//   void onInit() {
//     getAllCategories();
//     super.onInit();
//   }

//   void getAllCategories() {
//     HomeProvider().getCat().then((result) {
//       List<ListHome>? data = result.body;
//       change(data, status: RxStatus.success());
//     }, onError: (err) {
//       change(null, status: RxStatus.error(err.toString()));
//     });
//   }
// }

class HomeController extends GetxController with StateMixin<List<ListHome>> {
  @override
  void onInit() {
    super.onInit();
    getListHome();
  }

  Future<void> getListHome() async {
    final response =
        await GetConnect().get('https://odc.mpdev.my.id/get-group');
    if (response.status.isOk) {
      final data = List<ListHome>.from((response.body['data']['groups'] as List)
          .map((e) => ListHome.fromJson(e)));
      change(data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error('Error fetching data'));
    }
  }
}
