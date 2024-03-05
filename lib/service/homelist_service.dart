import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logtemp/model/homelist.dart';

class HomeListService {
 static Future<List<HomeList>> getCategories() async {
    const String url = 'https://odc.mpdev.my.id/';

    final response = await http.get(Uri.parse('$url/get-group')); 
    final body = jsonDecode(response.body);
    final result = body['data'];

    List<HomeList> dataGroups = List<HomeList>.from(result.map((data) => HomeList.fromJson(data)));

    return dataGroups;
  }
}