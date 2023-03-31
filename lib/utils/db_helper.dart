import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static final DataBaseHelper _databaseHelper = DataBaseHelper._();

  factory DataBaseHelper() {
    return _databaseHelper;
  }

  Database? db;

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    debugPrint("path---->$path");
    db = await openDatabase(
      join(path, 'userLoginData.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE userLogin (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              firstName TEXT NOT NULL,
              lastName TEXT NOT NULL,
              age INTEGER NOT NULL, 
              gender TEXT NOT NULL,
              email TEXT NOT NULL UNIQUE,
              password TEXT NOT NULL,
              conformPassword TEXT NOT NULL
              
            )
          """,
        );
        debugPrint("table--------------->>$db");
        debugPrint("table--------------created");
      },
      version: 1,
    );
  }

  Future<void> insertUser(UserModel user) async {
    int result = await db!.insert('userLogin', user.toMap());
    result;
    debugPrint("reult----------------->>$result");
  }

  // Future<int> insertUser(User user) async {
  //   int result = await db!.insert('demo', user.toMap());
  //    return   result;
  // }

  Future<int> updateUser(UserModel user) async {
    int result = await db!.update(
      'userLogin',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }

  Future<List<UserModel>> retrieveUsers() async {
    final List<Map<String, Object?>> queryResult = await db!.query('userLogin');
    debugPrint("queryResult----------------->>$queryResult");

    return queryResult.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<bool> checkEmailExist(String email) async {
    final List<Map<String, Object?>> queryResult = await db!.query('userLogin');
    debugPrint("queryResult----------------->>$queryResult");

    for (var items in queryResult) {
      debugPrint("Loop----------------->>$items");
      debugPrint("------------------->>${items['email'].toString()}");
      if (items['email'].toString() == email) {
        debugPrint("true email  ------------------------>>${items['email'].toString()}");
        // return Future.value(true);
        return true;
      }
    }

    // return Future.value(false);
    return false;
  }

  Future<void> deleteUser(int id) async {
    await db!.delete(
      'userLogin',
      where: "id = ?",
      whereArgs: [id],
    );

    debugPrint("delete----------------->>${db!.delete}");
  }
}
