import 'package:sqflite/sqflite.dart';
import 'package:ticketmaster/core/database/entities/event_entity.dart';
import 'package:ticketmaster/core/models/event.dart';

class DataBaseProvider {
  Database db;

  Future open() async {
    if (db == null) {
      db = await openDatabase(
        'event.db',
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

  Future<EventEntity> insert(Event event) async {
    var entity = EventEntity.fromEvent(event);
    await db.insert('eventtable', entity.toMap());
    return entity;
  }

  Future<EventEntity> getTodo(String id) async {
    List<Map> maps = await db.query('eventtable', where: '$id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return EventEntity.fromMap(maps.first);
    }
    return null;
  }

  Future<List<EventEntity>> getAll() async {
    List<Map> maps = await db.query('eventtable');
    if (maps.length > 0) {
      return maps.map((obj) => EventEntity.fromMap(obj)).toList();
    }
    return [];
  }

  Future<int> delete(String id) async {
    return await db.delete('eventtable', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
