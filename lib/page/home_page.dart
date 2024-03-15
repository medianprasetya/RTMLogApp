import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:logtemp/component/home_menu_list.dart';
import 'package:faker/faker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // static const routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Faker fkr = Faker();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // Index for tracking the active view
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    // final homec = Get.find<HomeController>();

    return Scaffold(
      // Use Stack to position the container
      body: Stack(
        children: [
          // Body
          Positioned.fill(
            top: 160,
            // Fills the remaining space
            child: IndexedStack(
              index: _currentIndex,
              children: [
                // Tampilan pertama
                const Center(
                  child: Text('Tampilan Kesatu'),
                ),

                // Tampilan kedua (List Menu)
                MenuHome(),

                // Tampilan ketiga
                const Center(
                  child: Text('Tampilan Ketiga'),
                ),
              ],
            ),
          ),

          // App bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              toolbarHeight: 150,
              backgroundColor: Colors.lightBlue,
              elevation: 0,
              titleSpacing: 0.0, // Remove default title spacing
            ),
          ),

          // Container with shadow and margin
          Positioned(
            top: 100, // Adjust margin as needed
            left: 20,
            right: 20,
            child: Container(
                // width: 250,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0, // Blur radius
                      spreadRadius: 0.8, // Spread radius
                      offset: Offset(1.0, 8.0), // Shadow offset (x, y)
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    25,
                    (index) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(child: Text('Y')),
                    ),
                  ),
                )),
          ),
        ],
      ),

      // Bottom navigation bar
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
