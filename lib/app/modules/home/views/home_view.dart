import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:using_google_maps_api/app/modules/home/widgets/home_view_future_address_list.dart';
import 'package:using_google_maps_api/app/modules/home/widgets/home_view_text_field.dart';
import 'package:using_google_maps_api/app/modules/home/widgets/home_view_title.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            homeViewTextField(
              onTap: () {
                Get.toNamed('/map');
              },
            ),
            homeViewTitle(),
            homeViewFutureAddressList(controller),
          ],
        ),
      ),
    );
  }
}
