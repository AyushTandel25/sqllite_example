import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqllite_example/app/model/notes_data_model.dart';

class NotesDataBase{

  static final instance = NotesDataBase._init();

  static Database? _database;

  NotesDataBase._init();

  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database = await _initDb("notes_database.db");
    return _database!;
  }

  Future<Database> _initDb(String filePath) async{

    var dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);

    return await openDatabase(path,version: 1,onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async{
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const boolType = "BOOLEAN NOT NULL";
    const textType = "TEXT NOT NULL";

    await db.execute("CREATE TABLE $notesTableName ("
        "${NotesFields.id} $idType"
        "${NotesFields.isImportant} $boolType"
        "${NotesFields.title} $textType"
        "${NotesFields.description} $textType"
        "${NotesFields.time} $textType)");

  }

  Future<NotesData> create(NotesData note) async{
    final db = await instance.database;

    final id = await db.insert(notesTableName, note.toJson());
    return note;
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }

}