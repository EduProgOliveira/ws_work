import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    var path = join(await getDatabasesPath(), 'wswork.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_user);
    await db.execute(_car);
  }

  Future? getUser() async {
    try {
      var db = await database;
      var result = await db.query('user');
      return result.first;
    } catch (e) {
      return null;
    }
  }

  Future? saveUser({required Map<String, dynamic> map}) async {
    try {
      var db = await database;
      var result = await db.insert('user', map);
      return result > 0;
    } catch (e) {
      return null;
    }
  }

  Future? saveCar({required Map<String, dynamic> map}) async {
    try {
      var db = await database;
      var car = await db.query('car', where: 'id = ?', whereArgs: [map['id']]);

      if (car.isNotEmpty) return null;
      var result = await db.insert('car', map);
      return result > 0;
    } catch (e) {
      return null;
    }
  }

  Future? logout() async {
    var db = await database;
    await db.delete('user');
    await db.delete('car');
    return true;
  }

  String get _user => '''
    CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT,
      name  TEXT
    );
  ''';

  String get _car => '''
    CREATE TABLE car(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      marca_id INT,
      marca_nome TEXT,
      nome_modelo TEXT,
      ano INT,
      combustivel TEXT,
      num_portas TEXT,
      valor_fipe REAL,
      cor TEXT
    );
  ''';
}
