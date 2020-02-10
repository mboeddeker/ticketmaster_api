import 'package:sqflite/sqflite.dart';
import 'package:ticketmaster/core/database/database_provider.dart';
import 'package:sqflite/sqlite_api.dart';

class MockDBProvider extends DataBaseProvider {
  @override
  Future open() async {
    if (db == null) {
      db = await openDatabase(
        inMemoryDatabasePath,
        version: 2,
        onCreate: (Database db, int version) async {
          await db.execute('''
  create table eventtable ( 
  id text primary key, 
  name text not null,
  url text not null,
  date text not null)
''');
        },
      );
    }
  }
}
