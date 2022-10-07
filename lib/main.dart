import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:using_google_maps_api/utils/setup_injections.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  setupInjection();
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
