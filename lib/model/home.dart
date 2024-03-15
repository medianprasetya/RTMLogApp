class ListHome {
  final String GroupID;
  final String GroupName;

  ListHome({
    required this.GroupID,
    required this.GroupName,
  });

  factory ListHome.fromJson(Map<String, dynamic> json) => ListHome(
        GroupID: json['GroupID'],
        GroupName: json['GroupName'],
      );

  // Map<String, dynamic> toJson() => {
  //       'GroupID': GroupID,
  //       'GroupName': GroupName,
  //     };
}
