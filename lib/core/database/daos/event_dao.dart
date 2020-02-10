import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketmaster/core/database/database_provider.dart';
import 'package:ticketmaster/core/database/entities/event_entity.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/core/models/event.dart';

class EventDao {
  DataBaseProvider dataBaseProvider;

  EventDao({@required this.dataBaseProvider});

  Future<bool> saveEvent(Event event) async {
    await dataBaseProvider.open();
    var isAlreadyFavorite = await isFavorite(event.id);
    if (isAlreadyFavorite) return false;
    final entitiy = dataBaseProvider.insert(event);
    return entitiy != null;
  }

  Future<bool> removeEvent(String id) async {
    await dataBaseProvider.open();
    var result = await dataBaseProvider.delete(id);
    return result != 0;
  }

  Future<bool> isFavorite(String id) async {
    var list = await getEvents() ?? [];
    final index = list.indexWhere((entity) => entity.id == id);
    return index != -1;
  }

  Future<List<EventEntity>> getEvents() async {
    await dataBaseProvider.open();
    return dataBaseProvider.getAll();
  }
}
