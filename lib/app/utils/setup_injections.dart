import 'package:get_it/get_it.dart';
import 'package:using_google_maps_api/app/data/dao/address_dao_imp.dart';
import 'package:using_google_maps_api/app/domain/interfaces/address_dao.dart';
import 'package:using_google_maps_api/app/domain/services/address_service.dart';

setupInjectio() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<AddressDAO>(AddressDAOImp());
  getIt.registerSingleton<AddressService>(AddressService());
}
