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
              CircleAvatar(
                minRadius: 50,
                child: Icon(
                  Icons.add_moderator_outlined,
                  size: 50,
                ),
              ),
              // table atau list ya?
              SizedBox(
                height: 20,
              ),

              Container(
                // color: Colors.blue,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        // color: Colors.green,
                        // margin: EdgeInsets.all(4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Lower Limit"),
                            Text(
                                '${state?.lowerLimit ?? ""} ${state?.unit ?? ""}'),
                            Icon(
                              Icons.check_rounded,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Offset"),
                            Text('${state?.offset ?? ""} ${state?.unit ?? ""}'),
                            Icon(
                              Icons.eco_sharp,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Upper Limit"),
                            Text(
                              '${state?.upperLimit ?? ""} ${state?.unit ?? ""}',
                              style: TextStyle(color: Colors.red),
                            ),
                            Icon(
                              Icons.error_outline_sharp,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Text('heeheh'),
              ),
            ],
          ),
        ),
        onError: (error) => Center(
          child: Text('Error: $error'),
        ),
        onLoading: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
