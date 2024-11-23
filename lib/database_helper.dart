import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('journal.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE journal (
        id $idType,
        content $textType
      )
    ''');
  }

  Future<int> createJournal(String content) async {
    final db = await instance.database;
    final data = {'content': content};
    return await db.insert('journal', data);
  }

  Future<List<Map<String, dynamic>>> readJournals() async {
    final db = await instance.database;
    return await db.query('journal');
  }

  Future<int> updateJournal(int id, String content) async {
    final db = await instance.database;
    final data = {'content': content};
    return await db.update('journal', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteJournal(int id) async {
    final db = await instance.database;
    return await db.delete('journal', where: 'id = ?', whereArgs: [id]);
  }
}
