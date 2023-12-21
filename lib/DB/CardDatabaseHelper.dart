import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CardDatabaseHelper {
  static const _databaseName = 'card_database.db';
  static const _databaseVersion = 1;

  static const table = 'cards';

  static const columnId = '_id';
  static const columnCardType = 'card_type';
  static const columnCardNumber = 'card_number';
  static const columnExpiryDate = 'expiry_date';
  static const columnCVC = 'cvc';

  // Make this a singleton class
  CardDatabaseHelper._privateConstructor();
  static final CardDatabaseHelper instance = CardDatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCardType TEXT,
        $columnCardNumber TEXT,
        $columnExpiryDate TEXT,
        $columnCVC TEXT
      )
    ''');
  }

  // Helper methods

  // Insert a card into the database
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Get all cards from the database
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Other methods like update, delete, etc., can be added based on your requirements
}
