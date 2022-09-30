import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:using_google_maps_api/app/utils/setup_injections.dart';

import 'app/routes/app_pages.dart';

void main() {
  setupInjection();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
