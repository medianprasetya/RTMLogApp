import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  static const routeName = '/homedetailpage';

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final Faker fkr = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
        toolbarHeight: 80,
        // backgroundColor: Colors,
        elevation: 0,
      ),
      // Body
      body: const Row(
        children: [
          Stack(
            children: [],
          )
        ],
      ),
      // Bottom Navigation
    );
  }
}
