import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';

abstract class AddressDAO {
  Future<List<AddressEntity>> getList();
  Future<AddressEntity> getById(int? id);
  save(AddressEntity address);
  remove(int addressId);
}
