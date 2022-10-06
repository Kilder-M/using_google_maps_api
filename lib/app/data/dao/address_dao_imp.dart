import 'package:sqflite/sqflite.dart';
import 'package:using_google_maps_api/app/data/db_connection.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';
import 'package:using_google_maps_api/app/domain/interfaces/address_dao.dart';

class AddressDAOImp implements AddressDAO {
  Database? _db;

  @override
  Future<List<AddressEntity>> getList() async {
    _db = await DBConnection.getConnection();
    List<Map<String, dynamic>> queryResult = await _db!.query('address');
    List<AddressEntity> addressList =
        List.generate(queryResult.length, (index) {
      var row = queryResult[index];
      return AddressEntity.fromMap(row);
    });
    return addressList;
  }

  @override
  remove(int addressId) async {
    _db = await DBConnection.getConnection();
    var sql = '''
    DELETE FROM address WHERE id = ?
   ''';
    await _db!.rawDelete(sql, [addressId]);
  }

  @override
  Future<AddressEntity> save(AddressEntity address) async {
    _db = await DBConnection.getConnection();
    String sql;
    if (address.id == null) {
      sql = '''INSERT INTO address(address)VALUES(?)''';
      address.id = await _db!.rawInsert(sql, [
        address.address,
      ]);
      return address;
    } else {
      sql = '''UPDATE address SET address = ? WHERE id = ?''';
      await _db!.rawUpdate(sql, [address.address]);
      return address;
    }
  }

  @override
  Future<AddressEntity> getById(int? id) async {
    if (id != null) {
      _db = await DBConnection.getConnection();
      List<Map<String, dynamic>> queryResult =
          await _db!.query('address', where: 'id = ?', whereArgs: [id]);
      List<AddressEntity> addressList =
          List.generate(queryResult.length, (index) {
        var row = queryResult[index];
        return AddressEntity.fromMap(row);
      });
      return addressList.first;
    }
    return AddressEntity();
  }
}
