import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StorageService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'dados.db');
    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE dados(id INTEGER PRIMARY KEY, peso REAL)');
    });
  }

  Future<void> saveDados(List<Map<String, dynamic>> dados) async {
    final db = await database;
    for (var dado in dados) {
      await db.insert('dados', dado, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<Map<String, dynamic>>> loadDados() async {
    final db = await database;
    return await db.query('dados');
  }

  Future<void> saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  Future<bool> getLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> saveIp(String ip) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('ip', ip);
}

Future<String> getIp() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('ip') ?? '';
}
}