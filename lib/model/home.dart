// import 'dart:convert';

// ListHome listHomeFromJson(String str) => ListHome.fromJson(json.decode(str));

// String listHomeToJson(ListHome data) => json.encode(data.toJson());

class ListHome {
  String groupId;
  String groupName;
  DateTime addedTime;
  DateTime modifiedTime;

  ListHome({
    required this.groupId,
    required this.groupName,
    required this.addedTime,
    required this.modifiedTime,
  });

  factory ListHome.fromJson(Map<String, dynamic> json) => ListHome(
        groupId: json["GroupID"] ?? "",
        groupName: json["GroupName"] ?? "",
        addedTime: DateTime.parse(json["AddedTime"] ?? ""),
        modifiedTime: DateTime.parse(json["ModifiedTime"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "GroupID": groupId,
        "GroupName": groupName,
        "AddedTime": addedTime.toIso8601String(),
        "ModifiedTime": modifiedTime.toIso8601String(),
      };
}
