//2 setelah bikin model,bikin provider dulu buat kontekan sama API terus ke controller
import 'package:get/get.dart';
import 'package:logtemp/model/home.dart';

class HomeProvider extends GetConnect {
  var url = 'https://odc.mpdev.my.id/get-group';
  // get kategori
  // Future<Response> getCat() => get("https://odc.mpdev.my.id/get-group");
  Future<Response<List<ListHome>>> getCat() => get<List<ListHome>>(url);

  // @override
  // void onInit() {
  //   // All request will pass to jsonEncode so CasesModel.fromJson()
  //   httpClient.defaultDecoder = ListHome.listFromJson;
  //   httpClient.addRequestModifier((request) {
  //     return request;
  //   });
  // }
}
