// To parse this JSON data, do
//
//     final listDetailHome = listDetailHomeFromJson(jsonString);

import 'dart:convert';

ListDetailHome listDetailHomeFromJson(String str) =>
    ListDetailHome.fromJson(json.decode(str));

String listDetailHomeToJson(ListDetailHome data) => json.encode(data.toJson());

class ListDetailHome {
  String? deviceId;
  String? deviceName;
  String? measuringValue;
  DateTime? measuringTime;
  String? upperLimit;
  String? lowerLimit;

  ListDetailHome({
    required this.deviceId,
    required this.deviceName,
    required this.measuringValue,
    required this.measuringTime,
    required this.upperLimit,
    required this.lowerLimit,
  });

  factory ListDetailHome.fromJson(Map<String, dynamic> json) => ListDetailHome(
        deviceId: json["DeviceID"] ?? "",
        deviceName: json["DeviceName"] ?? "",
        measuringValue: json["MeasuringValue"] ?? "",
        measuringTime: DateTime.parse(json["MeasuringTime"]),
        upperLimit: json["UpperLimit"] ?? "",
        lowerLimit: json["LowerLimit"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "DeviceID": deviceId,
        "DeviceName": deviceName,
        "MeasuringValue": measuringValue,
        "MeasuringTime": measuringTime,
        "UpperLimit": upperLimit,
        "LowerLimit": lowerLimit,
      };
}
