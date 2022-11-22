
import 'package:odc/data/Models/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List<Map> TasksScreen = [];
Database? DB;
class Data {
  Future<Database> createDB() async {
    String dataBasePath = await getDatabasesPath();
    print(dataBasePath);
    String path = join(dataBasePath, 'notes.db');
    print(path);
    return openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Note(id INTEGER PRIMARY KEY,title TEXT, description TEXT,date TEXT)');
        },
        onOpen: (db) => print("table created"));
    //
  }

  AddDB(NotesModel t) async {
    var DB = await createDB();
    DB.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO Note(title,description,date) VALUES("${t.title}","${t
              .description}", "${t.date}")')
          .then((value) => print('$value insert to db'));
      List<Map> list2 = await txn.rawQuery('SELECT * FROM Note');
      print(list2);
    });
  }
  Future<List<NotesModel>> getdata() async{
    var DB = await createDB();
    List<Map<String,Object?>> datas = await DB.query("Note");
    return datas.map((e) => NotesModel.fromMap(e)).toList();
  }
  Future<int>delete(int id) async{
    var DB = await createDB();
    return await DB.delete("Note",where: "id = ?",whereArgs: [id]);
  }
  Future<int> updateItem(NotesModel t) async {
    var dbClient = await createDB();
    return await dbClient.update("Note", t.toMap(),
        where: "id = ?", whereArgs: [t.id]);
  }

}