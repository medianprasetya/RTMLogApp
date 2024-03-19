import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logtemp/controllers/list_detail_homec.dart';

class HomeDetailPage extends GetView<HomeDetailController> {
  const HomeDetailPage({super.key});

  // static const routeName = '/homedetailpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Appbar
        appBar: AppBar(
          // title: Text(Get.parameters['pGroupID'].toString()),
          title: Text("Group of ${controller.groupID.toString()}"),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
          ),

          toolbarHeight: 80,

          elevation: 0,
        ),
        // Body
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: controller.obx(
                (state) => ListView.builder(
                  itemCount: state!.length,
                  itemBuilder: (context, index) {
                    final informasi = state[index];
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
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.lightBlue,
                              child: Text(
                                informasi.deviceId.toString(),
                                style: const TextStyle(color: Colors.white),
                              )),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.blueAccent,
                            size: 18,
                          ),
                          title: Text(informasi.deviceName.toString()),
                          onTap: () {
                            Get.toNamed("homedetailprofile",
                                arguments: informasi.deviceId);
                            // Get.defaultDialog(
                            //   barrierDismissible: true,
                            //   title: informasi.deviceName.toString(),
                            //   radius: BorderSide.strokeAlignCenter,

                            // Get.snackbar(
                            //   'Closing..',
                            //   'Data ${state[index]} ',
                            //   animationDuration: const Duration(seconds: 1),
                            //   duration: const Duration(seconds: 2),
                            //   icon: const Icon(Icons.info_outline),
                            //   backgroundColor:
                            //       const Color.fromARGB(47, 124, 170, 250),
                            // );
                            // },

                            // content: Column(
                            //   children: [
                            //     Table(
                            //       // border: TableBorder.all(width: 1),
                            //       children: [
                            //         TableRow(children: [
                            //           Text('Device ID'),
                            //           Text(
                            //             ': ${informasi.deviceId.toString()}',
                            //           ),
                            //         ]),
                            //         TableRow(children: [
                            //           Text('Device Name'),
                            //           Text(
                            //               ': ${informasi.deviceName.toString()}'),
                            //         ]),
                            //         TableRow(children: [
                            //           Text('Lower Limit'),
                            //           Text(
                            //               ': ${informasi.lowerLimit.toString()}'),
                            //         ]),
                            //         TableRow(children: [
                            //           Text('Upper Limit'),
                            //           Text(
                            //               ': ${informasi.upperLimit.toString()}'),
                            //         ]),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            // );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )
        // Bottom Navigation
        );
  }
}
