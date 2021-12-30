import 'package:goals_2022/infra/datasource/app_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

class AppDatabaseImpl implements AppDatabase {

  @override
  Future<Database> getDatabase({required String onCreate,required databaseName}) async {
    String path = join(databaseName);
    Database database =
        await openDatabase(path, onCreate: (database, version) async {
      await database.execute(onCreate);
    });
    return database;
  }
}
