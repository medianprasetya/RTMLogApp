import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/homepage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body
      body: const SafeArea(
        child: Column(),
      ),
      // bottom
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          animationDuration: const Duration(milliseconds: 400),
          color: Colors.lightBlue,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              print(index);
            });
          },
          items: const [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(Icons.refresh, color: Colors.white),
            Icon(Icons.error, color: Colors.white),
          ]),
    );
  }
}
