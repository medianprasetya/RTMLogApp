import 'package:logtemp/controllers/homec.dart';
import 'package:logtemp/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_loading/card_loading.dart';

// class MenuHome extends StatelessWidget {

class MenuHome extends GetView<HomeController> {
  const MenuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.obx(
        (state) => ListView.builder(
          // Gunakan panjang list dari controller.ListHome
          itemCount: state?.length,
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
                    child:
                        Icon(Icons.share_location_sharp, color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Color.fromARGB(255, 92, 115, 156),
                    size: 18,
                  ),
                  title: Text(
                      state![index].groupName), // Akses property dari ListHome
                  subtitle: Text(
                      state[index].groupId), // Akses property dari ListHome
                  onTap: () {
                    Get.toNamed(RouteName.homedetailpage,
                        arguments: state[index].groupId);
                    Get.snackbar(
                      'Memuat..',
                      'Data ${state[index].groupName}',
                      animationDuration: const Duration(seconds: 1),
                      duration: const Duration(seconds: 2),
                      icon: const Icon(Icons.info_outline),
                      backgroundColor: const Color.fromARGB(47, 124, 170, 250),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
              ),
            );
          },
        ),
        onEmpty: const Text("Data tidak ditemukan"),
        onError: (error) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Error: $error'),
            ),
            IconButton(
              icon: const Icon(Icons.refresh,
                  color: Color.fromARGB(255, 255, 166, 0)),
              color: Colors.amber,
              hoverColor: Colors.blue,
              iconSize: 30,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(88, 255, 176, 111))),
              onPressed: () => controller.getListHome(),
              padding: const EdgeInsets.all(10),
            )
          ],
        ),
        onLoading: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(30),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardLoading(
                            height: 30,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            width: 100,
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 40,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                          CardLoading(
                            height: 30,
                            width: 200,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
