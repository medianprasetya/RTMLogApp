import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '/component/menu_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey =
      GlobalKey();

  // Index untuk melacak tampilan mana yang sedang aktif
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body
      body: Container(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            
            // Tampilan pertama
             Container(
              child: const Center(
               child: Text('Tampilan Ketiga'),
              ),
             ),
        
          
             Column(
               children: [
                Menu(),Menu(),Menu(),Menu(),Menu(),
                 Container(
                  child: Center(
                    child: Menu(),
                  )),
               ],
             ),
          
            // Tampilan ketiga
            Container(
              // Ganti ini dengan tampilan baru yang diinginkan
              child: Center(
                child: Text('Tampilan Ketiga'),
              ),
            ),
          ],
        ),
      ),
      // bottom
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
