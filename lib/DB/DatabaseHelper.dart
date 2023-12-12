import 'dart:io';
import 'package:fyp_project_group_a/Model/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();
  static Database? _database;
  static const String _tableName = 'user_table';
  static const int _databaseVersion = 1;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, initialize it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'user_database.db');

    // Open the database
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          phoneNumber TEXT,
          email TEXT,
          dateOfBirth TEXT,
          password TEXT
        )
      ''');
      },
      onOpen: (db) async {
        // Check if the table exists, create it if not
        var tableExists = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name='$_tableName'",
        );

        if (tableExists.isEmpty) {
          await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phoneNumber TEXT,
            email TEXT,
            dateOfBirth TEXT,
            password TEXT
          )
        ''');
        }
      },
    );
  }

  Future<void> insertUser(User user) async {
    final Database db = await database;

    await db.insert(
      _tableName,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getUsers() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return User(
        name: maps[i]['name'],
        phoneNumber: maps[i]['phoneNumber'],
        email: maps[i]['email'],
        dateOfBirth: maps[i]['dateOfBirth'] != null
            ? DateTime.parse(maps[i]['dateOfBirth'])
            : null,
        password: maps[i]['password'],
      );
    });
  }

  Future<int> insertUseritem(User user) async {
    Database db = await database;
    return await db.insert(_tableName, user.toMap());
  }

  Future<bool> isEmailRegistered(String email) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<bool> authenticateUser(String identifier, String password) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'phoneNumber = ? OR email = ? AND password = ?',
      whereArgs: [identifier, identifier, password],
    );
    return result.isNotEmpty;
  }

}
