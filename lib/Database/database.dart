import 'dart:async';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute('''
        CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,token TEXT, firstName TEXT,lastName TEXT,email TEXT,role Text,Id INTEGER)''');
  }

  static Future<sql.Database> db() async {
    return sql
        .openDatabase('userdata.db', version: 1, //opendatabase is a function
            onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> insert(String? token, String? firstName, String? lastName,
      String? email, List<String>? role, int? Id) async {
    final db = await DatabaseHelper.db();
    final roleString = role.toString();
    final data = {
      'token': token,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': roleString,
      'id': Id,
    };
    final id = await db.insert('user', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print('data: $data with id:$id');
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.query('user', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('user', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<void> deleteItem() async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete(
        'user',
      );
    } catch (e) {
      print('Something went wrong deleting an item $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getToken() async {
    final db = await DatabaseHelper.db();
    return db.query(
      'user',
      where: "id = ?",
      limit: 1,
      columns: ['token'],
    );
  }
}
