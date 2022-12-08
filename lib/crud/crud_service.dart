import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""" 
    CREATE TABLE notes(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'notes.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

//creating a note
  static Future<int> createNote(String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {'title': title, 'description': description};
    final id = await db.insert('notes', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

//getting all notes
  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await SqlHelper.db();
    return db.query('notes', orderBy: 'createdAt');
  }

// getting a note
  static Future<List<Map<String, dynamic>>> getNote(int id) async {
    final db = await SqlHelper.db();
    return db.query('notes', where: 'id = ?', whereArgs: [id], limit: 1);
  }

//updating notes
  static Future<int> updateNotes(int id, String title,
      String? description) async {
    final db = await SqlHelper.db();

    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('notes', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

//deleting notes
  static Future<void> deleteNote(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete('notes', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print('something went wrong when deleting $e');
    }
  }
}
