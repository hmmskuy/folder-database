import 'package:database_2/model/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('notes.db');

    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        author TEXT,
        created_at TEXT,
        update_at TEXT
      )
    ''');

    Future<int> insertNote(Note note) async {
      final db = await instance.database;

      return await db.insert(
        'notes',
        note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    Future<List<Note>> getAllNotes() async {
      final db = await instance.database;

      final result = await db.query('notes', orderBy: 'created_at DESC');

      return result.map((json) => Note.fromMap(json)).toList();
    }

    Future<int> updateNote(Note note) async {
      final db = await instance.database;

      return await db.update(
        'notes',
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
      );
    }

    Future<int> deleteNote(int id) async {
      final db = await instance.database;
      return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
    }

    Future close() async {
      final db = await instance.database;
      db.close();
    }
  }

  Future<void> deleteNote(param0) async {}

  Future<void> updateNote(result) async {}

  Future<void> insertNote(result) async {}

  Future getAllNotes() async {}
}
