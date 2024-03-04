class ListHome {
  final String id;
  final String title;

  ListHome({required this.id, required this.title});

  factory ListHome.fromJson(Map<String, dynamic> json) {
    return ListHome(
      id: json['GroupID'] ?? '', // tambahkan null check dan default value
      title: json['GroupName'] ?? '', // tambahkan null check dan default value
    );
  }
}
