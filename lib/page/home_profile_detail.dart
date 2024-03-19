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
        title: Text(controller.deviceID),
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
        (state) => Center(
          // Tampilkan data dari controller di sini
          child: Text('Datas: ${state?.deviceName}'),
        ),
        onError: (error) => Center(
          child: Text('Error: $error'),
        ),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
