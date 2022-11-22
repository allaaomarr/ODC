
import 'package:odc/data/Models/support_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List<Map> TasksScreen = [];
Database? DB;
class Data {
  Future<Database> createDB() async {
    String dataBasePath = await getDatabasesPath();
    print(dataBasePath);
    String path = join(dataBasePath, 'support.db');
    print(path);
    return openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE support(id INTEGER PRIMARY KEY,name TEXT, email TEXT,support TEXT)');
        },
        onOpen: (db) => print("table created"));
    //
  }

  AddDB(SupportModel t) async {
    var DB = await createDB();
    DB.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO support(title,description,date) VALUES("${t.name}","${t
              .email}", "${t.support}")')
          .then((value) => print('$value insert to db'));
      List<Map> list2 = await txn.rawQuery('SELECT * FROM support');
      print(list2);
    });
  }
}