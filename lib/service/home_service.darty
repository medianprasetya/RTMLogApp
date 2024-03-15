import 'dart:convert';

import 'package:logtemp/model/home.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static String baseUrl = 'https://odc.mpdev.my.id/get-group';
  static Future<List<ListHome>> fetchDataHome() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      final body = response.body;
      final result = jsonDecode(body);
      List<ListHome> homecats =
          List<ListHome>.from(result['data']['groups'].map(
        (kategori) => ListHome.fromJson(kategori),
      ));
      return homecats;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
