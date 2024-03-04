import 'package:flutter/material.dart';
import 'package:logtemp/model/home.dart';
import 'package:logtemp/service/home_service.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({
    super.key,
  });

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  List<ListHome> kategoridata = [];
  void tryGetKategory() async {
    try {
      final result = await HomeService.fetchDataHome();
      setState(() {
        kategoridata = result;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    tryGetKategory();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final dataHome = kategoridata[index];
        return Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 226, 241, 255).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 12,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              minLeadingWidth: 2,
              leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.lightBlue,
                  child: Icon(Icons.category_rounded, color: Colors.white)),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.blueAccent,
                size: 18,
              ),
              title: Text(dataHome.id),
              subtitle: Text(dataHome.title),
              onTap: () {
                // Panggil fungsi fetchData saat item ditekan
                print(dataHome.id);
              },
            ),
          ),
        );
      },
      itemCount: kategoridata.length,
    );
  }
}
