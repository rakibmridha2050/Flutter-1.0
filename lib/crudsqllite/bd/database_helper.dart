import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../model/user.dart';


class DatabaseHelper {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            age INTEGER,
            gender TEXT,
            dob TEXT,
            isActive INTEGER
          )
        ''');
      },
    );
  }

  // CREATE
  Future<int> insertUser(User user) async => 
      (await database).insert('users', user.toMap());

  // READ
  Future<List<User>> getUsers() async {
    final res = await (await database).query('users');
    return res.map((e) => User.fromMap(e)).toList();
  }

  // UPDATE
  Future<int> updateUser(User user) async =>
      (await database).update('users', user.toMap(), where: 'id=?', whereArgs: [user.id]);

  // DELETE
  Future<int> deleteUser(int id) async =>
      (await database).delete('users', where: 'id=?', whereArgs: [id]);
}