class HomeList {
String id;
String name;

HomeList.init({
required this.id,
required this.name,
});

factory HomeList.fromJson(Map<String, dynamic> json) {
return HomeList.init(
id: json['id'],
name: json['name'],
);
}

}