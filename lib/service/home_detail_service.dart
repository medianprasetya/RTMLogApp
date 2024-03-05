import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logtemp/model/homedetail.dart';

class HomeDetailService {
  static String baseUrl = 'https://odc.mpdev.my.id/dashboard/home?pGroupID=';
  static Future<List<ListDetailHome>> fetchDataList(String deviceID) async {
    try {
      final response =
          await http.get(Uri.parse(baseUrl + Uri.encodeComponent(deviceID)));

      if (response.statusCode == 200) {
        final body = response.body;
        final result = jsonDecode(body);
        List<ListDetailHome> homecats =
            List<ListDetailHome>.from(result['data']['data'].map(
          (kategori) => ListDetailHome.fromJson(kategori),
        ));
        return homecats;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
