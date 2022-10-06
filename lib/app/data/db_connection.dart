import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:using_google_maps_api/app/data/script.dart';

class DBConnection {
  static Database? _db;

  static Future<Database> getConnection() async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), 'address_db');
      deleteDatabase(path);
      return _db =
          await openDatabase(path, version: 1, onCreate: (db, v) async {
        await db.execute(createAddressTable);
        await db.rawInsert(createAddress);
      });
    }
    return _db!;
  }
}
