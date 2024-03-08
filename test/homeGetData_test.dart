import 'dart:convert';
// ignore_for_file: file_names

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  String groupID, groupName;

  HomeApi({required this.groupID, required this.groupName});

  static Future<List<HomeApi>> getAllCategory() async {
    Uri uri = Uri.parse('https://odc.mpdev.my.id/get-group');
    var hasilResponseHome = await http.get(uri);
    var homelist = (json.decode(hasilResponseHome.body))['data']['groups'];

    List<HomeApi> datahome = homelist.map((group) {
      return HomeApi(
        groupID: group['GroupID'],
        groupName: group['GroupName'],
      );
    }).toList();

    return datahome;
  }
}
