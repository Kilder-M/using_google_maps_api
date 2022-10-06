import 'package:get/get.dart';

import '../aplication/modules/home/bindings/home_binding.dart';
import '../aplication/modules/home/views/home_view.dart';
import '../aplication/modules/map/bindings/map_binding.dart';
import '../aplication/modules/map/views/map_view.dart';
import '../aplication/modules/splash/bindings/splash_binding.dart';
import '../aplication/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => const MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
