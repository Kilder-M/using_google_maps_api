import 'package:get_it/get_it.dart';
import 'package:using_google_maps_api/app/data/dao/address_dao_imp.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';
import 'package:using_google_maps_api/app/domain/interfaces/address_dao.dart';

class AddressService {
  final _addressDAO = GetIt.I<AddressDAO>();

  Future<AddressEntity> save(AddressEntity address) async {
    return await _addressDAO.save(address);
  }

  remove(int addressId) async {
    await _addressDAO.remove(addressId);
  }

  Future<List<AddressEntity>> getList() async {
    return await _addressDAO.getList();
  }

  Future<AddressEntity> getById(int? id) async {
    return await _addressDAO.getById(id);
  }
}
