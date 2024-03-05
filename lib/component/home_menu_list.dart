import 'package:flutter/material.dart';
import 'package:logtemp/model/home.dart';
import 'package:logtemp/page/home_detail_page.dart';
import 'package:logtemp/service/home_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({
    super.key,
  });

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  List<ListHome> kategoridata = [];
  Future<void> tryGetKategory() async {
    try {
      final result = await HomeService.fetchDataHome();
      if (mounted) {
        setState(() {
          kategoridata = result;
        });
      }
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
    return LiquidPullToRefresh(
      showChildOpacityTransition: true,
      backgroundColor: Colors.lightBlue,
      borderWidth: 3,
      height: 120,
      animSpeedFactor: 550,
      color: Colors.transparent,
      onRefresh: tryGetKategory,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final dataHome = kategoridata[index];
          return Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
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
                contentPadding: const EdgeInsets.all(8),
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
                  Navigator.of(context).pushNamed(HomeDetailPage.routeName,
                      arguments: dataHome.id);
                },
              ),
            ),
          );
        },
        itemCount: kategoridata.length,
      ),
    );
  }
}
