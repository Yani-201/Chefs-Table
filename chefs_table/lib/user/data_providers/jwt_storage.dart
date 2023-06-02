import 'dart:async';
import 'package:sqflite/sqflite.dart';

class TokenStorage {
  static const String jwtTable = 'jwtTokens';

  Future<Database> open() async {
    return await openDatabase('tokenDB.db', version: 1,
        onCreate: (db, version) {
      print("#######CREATING#####");
      db.execute('CREATE TABLE $jwtTable ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'token LONGTEXT NOT NULL'
          ')');
    });
  }

  Future<dynamic> saveToken(String token) async {
    final db = await open();
    print(token);
    await db.delete(jwtTable);
    return await db.insert(jwtTable, {
      'token': token,
    });
  }

  Future<String?> getToken() async {
    final db = await open();
    final results = await db.query(jwtTable);
    if (results.isEmpty) {
      return null;
    }
    return results[0]['token'].toString();
  }

  Future<void> deleteToken() async {
    final db = await open();
    await db.delete(jwtTable);
  }
}
