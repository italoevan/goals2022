import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/external/app_databaseimpl.dart';
import 'package:goals_2022/infra/datasource/goal_dao.dart';
import 'package:sqflite/sqflite.dart';

class GoalDaoImpl implements GoalDao {
  Future<Database>? _database;
  final String table = "goals";

  // ignore: non_constant_identifier_names
  GoalDaoImpl() {
    _database = AppDatabaseImpl().getDatabase(
        onCreate: "CREATE TABLE $table (id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "done int"
            ",name varchar(255) NOT NULL,"
            "motivationalPhrase varchar(255)"
            ")",
        databaseName: table);
  }

  @override
  Future insert(Goal goal) async {
    Database? db = await _database;

    if (db != null) {
      await db.insert(table, goal.toMap());
    }
  }

  @override
  Future<List<Goal>?> read() async {
    Database? db = await _database;
    List<Map<String, Object?>>? response;

    if (db != null) {
      response = await db.query(table);
    }

    if (response != null) {
      List<Goal> goals = [];

      for (Map<String, Object?> map in response) {
        goals.add(Goal.fromMap(map));
      }

      return goals;
    }
    return null;
  }
}
