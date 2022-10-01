import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';
import 'package:using_google_maps_api/app/domain/services/address_service.dart';

class HomeController extends GetxController {
  final _service = GetIt.I<AddressService>();

  var addressList = <AddressEntity>[].obs;

  Future<List<AddressEntity>> getAddressList() async {
    return addressList.value = await _service.getList();
  }

  removeAddress(AddressEntity addressEntity) {
    _service.remove(addressEntity.id!);
  }
}
