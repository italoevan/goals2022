import 'package:sqflite/sqflite.dart';

abstract class AppDatabase {
  Future<Database> getDatabase({required String onCreate, required databaseName});
}
