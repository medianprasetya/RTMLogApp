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
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),

        toolbarHeight: 60,
        // backgroundColor: Colors.grey,
        // elevation: 4,
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
                  Icons.add_to_queue_outlined,
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
                            // print(state!.deviceName),
                            print(Get.arguments),
                            // ProfileDetailController()
                            //     .getDataProfile(Get.arguments),
                            // ProfileDetailController()
                            //     .getLatestData(Get.arguments).then((value) {

                            //     },),
                            Get.defaultDialog(
                              title: "Last Temperature Detected",
                              content: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state!.measuringValue,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 40,
                                    ),
                                  ),
                                  Text(
                                    state.timeOnly.toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 255, 255, 255)),
                          alignment: Alignment.center),
                      icon: const Icon(Icons.location_pin),
                      label: Text(state?.deviceName ?? "Refresh")),
                ),
              ),

              //separator
              const SizedBox(
                height: 20,
              ),

              // bawah
              Flexible(
                fit: FlexFit.loose,
                flex: 4,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: <Widget>[
                    DetailInformation(
                      name: "IP Address",
                      value: state?.ipAddress,
                    ),
                    DetailInformation(
                      name: "APN",
                      value: state?.apn,
                    ),
                    DetailInformation(
                      name: "DNS",
                      value: state?.dns,
                    ),
                    DetailInformation(
                      name: "Gateway",
                      value: state?.gateway,
                    ),
                    DetailInformation(
                      name: "Group ID",
                      value: state?.groupId,
                    ),
                    DetailInformation(
                      name: "Subnet Mask",
                      value: state?.subnet,
                    ),
                    DetailInformation(
                      name: "Unit",
                      value: state?.unit,
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

                          SizedBox(
                            // color: Colors.blue,
                            height: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CardLoading(
                                        height: 400,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
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

class DetailInformation extends StatelessWidget {
  final String? name;
  final String? value;

  const DetailInformation({
    super.key,
    this.name,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: ,
      leading: CircleAvatar(child: Image.asset("assets/images/chick.png")),
      title: Text(
        value ?? "-",
        style: const TextStyle(
          fontSize: 16,
          letterSpacing: 1.2,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Text(
          name ?? "-",
          style: const TextStyle(
            color: Colors.green,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
