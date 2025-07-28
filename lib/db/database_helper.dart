import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';
import '../models/appointment.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'healthcare_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT,
            password TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE appointments (
            id INTEGER PRIMARY KEY,
            userId INTEGER,
            doctorId INTEGER,
            slot TEXT,
            status TEXT
          )
        ''');
      },
    );
  }

  // User CRUD
  Future<int> insertUser(User user) async {
    final dbClient = await db;
    return await dbClient.insert('users', user.toMap());
  }

  Future<User?> getUser(String email, String password) async {
    final dbClient = await db;
    final result = await dbClient.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }

  // Appointment CRUD
  Future<int> insertAppointment(Appointment appointment) async {
    final dbClient = await db;
    return await dbClient.insert('appointments', appointment.toMap());
  }

  Future<List<Appointment>> getAppointmentsByUser(int userId) async {
    final dbClient = await db;
    final result = await dbClient.query('appointments', where: 'userId = ?', whereArgs: [userId]);
    return result.map((e) => Appointment.fromMap(e)).toList();
  }
} 