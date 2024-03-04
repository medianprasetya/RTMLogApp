import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:logtemp/view/home_menu_list.dart';
import 'package:faker/faker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Faker fkr = Faker();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // Index untuk melacak tampilan mana yang sedang aktif
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    // List<HomeApi> datahome = [];

    return Scaffold(
      // Appbar
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        toolbarHeight: 10,
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      // Body
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Tampilan pertama
          Container(
            constraints: BoxConstraints.loose(const Size(20, 960)),
            child: const Placeholder(),
          ),

          // Tampilan kedua (List Menu)
          const MenuHome(),

          // Tampilan ketiga
          const Center(
            child: Text('Tampilan Ketiga'),
          ),
        ],
      ),
      // Bottom Navigation
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _currentIndex,
        animationDuration: const Duration(milliseconds: 400),
        color: Colors.lightBlue,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.android_outlined,
            color: Colors.white,
          ),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.error, color: Colors.white),
        ],
      ),
    );
  }
}
