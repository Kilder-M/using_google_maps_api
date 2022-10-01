import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';
import 'package:using_google_maps_api/app/domain/interfaces/address_dao.dart';

class HomeController extends GetxController {
  final _dao = GetIt.I<AddressDAO>();

  var addressList = <AddressEntity>[].obs;

  Future<List<AddressEntity>> getAddressList() async {
    return addressList.value = await _dao.getList();
  }

  removeAddress(AddressEntity addressEntity) {
    _dao.remove(addressEntity.id!);
  }
}
