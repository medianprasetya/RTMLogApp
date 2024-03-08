import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:logtemp/model/homedetail.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  static const routeName = '/homedetailpage';

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final Faker fkr = Faker();
  List<ListDetailHome> kategoridata = [];

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
          // flexibleSpace: const Image(
          //   image: AssetImage("assets/images/chick.png"),
          //   alignment: Alignment.bottomCenter,
          //   // fit: BoxFit.,
          //   height: 50,
          //   width: 50,
          //   repeat: ImageRepeat.noRepeat,
          // ),
          toolbarHeight: 80,
          // backgroundColor: Colors,
          elevation: 0,
        ),
        // Body
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 226, 241, 255)
                              .withOpacity(0.5),
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
                            child: Icon(Icons.share_location_sharp,
                                color: Colors.white)),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.blueAccent,
                          size: 18,
                        ),
                        title: Text('tetetetees'),
                        subtitle: Text('tetetetees'),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )
        // Bottom Navigation
        );
  }
}
