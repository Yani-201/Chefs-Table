<<<<<<< HEAD
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class TokenStorage {
  static const String jwtTable = 'jwt-tokens';

  Future<Database> open() async {
    return await openDatabase('tokens.db', version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE $jwtTable ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'token TEXT NOT NULL'
          ')');
    });
  }

  Future<void> saveToken(String token) async {
    final db = await open();
    await db.insert(jwtTable, {
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
=======
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class TokenStorage {
  static const String jwtTable = 'jwt-tokens';

  Future<Database> open() async {
    return await openDatabase('tokens.db', version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE $jwtTable ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'token TEXT NOT NULL'
          ')');
    });
  }

  Future<void> saveToken(String token) async {
    final db = await open();
    await db.insert(jwtTable, {
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
>>>>>>> c5908b340f33a5070444762cdbd02208ea618d6d
