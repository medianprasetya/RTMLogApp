// To parse this JSON data, do
//
//     final profileDetail = profileDetailFromJson(jsonString);

// import 'dart:convert';

// ProfileDetail profileDetailFromJson(String str) =>
//     ProfileDetail.fromJson(json.decode(str));

// String profileDetailToJson(ProfileDetail data) => json.encode(data.toJson());

class ProfileDetail {
  String deviceName;
  String location;
  String groupId;
  String lowerLimit;
  String upperLimit;
  String unit;
  String offset;
  String ipAddress;
  String dns;
  String gateway;
  String subnet;
  String apn;
  String apnPasswd;
  DateTime addedTime;
  DateTime modifiedTime;

  ProfileDetail({
    required this.deviceName,
    required this.location,
    required this.groupId,
    required this.lowerLimit,
    required this.upperLimit,
    required this.unit,
    required this.offset,
    required this.ipAddress,
    required this.dns,
    required this.gateway,
    required this.subnet,
    required this.apn,
    required this.apnPasswd,
    required this.addedTime,
    required this.modifiedTime,
  });

  factory ProfileDetail.fromJson(Map<String, dynamic> json) => ProfileDetail(
        deviceName: json["DeviceName"] ?? "",
        location: json["Location"] ?? "",
        groupId: json["GroupID"] ?? "",
        lowerLimit: json["LowerLimit"] ?? "",
        upperLimit: json["UpperLimit"] ?? "",
        unit: json["Unit"] ?? "",
        offset: json["Offset"] ?? "",
        ipAddress: json["IpAddress"] ?? "",
        dns: json["Dns"] ?? "",
        gateway: json["Gateway"] ?? "",
        subnet: json["Subnet"] ?? "",
        apn: json["Apn"] ?? "",
        apnPasswd: json["ApnPasswd"] ?? "",
        addedTime: DateTime.parse(json["AddedTime"] ?? ""),
        modifiedTime: DateTime.parse(json["ModifiedTime"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "DeviceName": deviceName,
        "Location": location,
        "GroupID": groupId,
        "LowerLimit": lowerLimit,
        "UpperLimit": upperLimit,
        "Unit": unit,
        "Offset": offset,
        "IpAddress": ipAddress,
        "Dns": dns,
        "Gateway": gateway,
        "Subnet": subnet,
        "Apn": apn,
        "ApnPasswd": apnPasswd,
        "AddedTime": addedTime.toIso8601String(),
        "ModifiedTime": modifiedTime.toIso8601String(),
      };
}
