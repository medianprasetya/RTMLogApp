import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logtemp/controllers/profile_detailc.dart';

class HomeProfileDetail extends GetView<ProfileDetailController> {
  const HomeProfileDetail({super.key});

  // static const routeName = '/HomeProfileDetail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text(controller.state?.groupId.toString() ?? ""),
        // title: Text(),
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
      body: controller.obx(
        (state) => SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // pemanis
              const CircleAvatar(
                minRadius: 50,
                child: Icon(
                  Icons.add_moderator_outlined,
                  size: 50,
                ),
              ),
              // table atau list ya?
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                // color: Colors.blue,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Lower Limit"),
                          Text(
                              '${state?.lowerLimit ?? ""} ${state?.unit ?? ""}'),
                          const Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Offset"),
                          Text('${state?.offset ?? ""} ${state?.unit ?? ""}'),
                          const Icon(
                            Icons.eco_sharp,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Upper Limit"),
                          Text(
                            '${state?.upperLimit ?? ""} ${state?.unit ?? ""}',
                            style: const TextStyle(color: Colors.red),
                          ),
                          const Icon(
                            Icons.error_outline_sharp,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton.icon(
                      onPressed: () => {
                            print(state?.deviceName),
                            ProfileDetailController()
                                .getDataProfile(state?.deviceName),
                          },
                      style: const ButtonStyle(alignment: Alignment.center),
                      icon: const Icon(Icons.location_pin),
                      label: Text(state?.deviceName ?? "Refresh")),
                ),
              ),

              //separator
              const SizedBox(
                height: 20,
              ),

              // bawah
              SizedBox(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 226, 252, 228),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(-0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        height: 200,
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(232, 0, 165, 14),
                                  ),
                                  child: Icon(Icons.code, color: Colors.white),
                                ),
                                // Text(state?.deviceName ?? "Refresh"),
                              ],
                            ),
                            Text("IP : ${state?.ipAddress ?? "IP Address"}"),
                            Text("D  ${state?.dns ?? "IP Address"}"),
                            Text("G  ${state?.gateway ?? "IP Address"}"),
                            Text("A : ${state?.apn ?? "IP Address"}"),
                            Text("IP"),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(232, 0, 165, 14),
                              ),
                              child: Text("Address Information",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onError: (error) => Column(
          children: [
            Center(
              child: Text('Error: $error'),
            ),
            FloatingActionButton.small(
              elevation: 5,
              child: const Icon(Icons.refresh),
              onPressed: () => controller.getDataProfile(controller.deviceID),
            )
          ],
        ),
        onLoading: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // pemanis
                          CardLoading(
                            height: 100,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            width: 100,
                          ),

                          // table atau list ya?
                          SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            // color: Colors.blue,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CardLoading(
                                        height: 50,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        width: 80,
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CardLoading(
                                        height: 50,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        width: 80,
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CardLoading(
                                        height: 50,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        width: 80,
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
