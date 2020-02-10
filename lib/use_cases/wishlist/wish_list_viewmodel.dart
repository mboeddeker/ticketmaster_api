import 'package:flutter/material.dart';
import 'package:ticketmaster/core/database/daos/event_dao.dart';
import 'package:ticketmaster/core/database/entities/event_entity.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/core/services/ticketmaster_service.dart';
import 'package:ticketmaster/core/utils/generic_state.dart';
import 'package:ticketmaster/use_cases/eventdetail/event_detail.dart';

abstract class Input {
  Future<void> loadFavorites();
  Future<void> navigateToDetail(BuildContext context, EventEntity event);
}

abstract class Output {
  GenericState<List<EventEntity>> provideFavoriteEvents();
  String provideEventName(int index);
  String provideEventImage(int index);
}

class WishListViewModel implements Input, Output {
  final _dao = inject<EventDao>();
  final _service = inject<TicketMasterService>();

  GenericState<List<EventEntity>> _favoriteEventsState = GenericState.initWith([]);

  @override
  Future<void> loadFavorites() async {
    List<EventEntity> favoriteEvents = await _dao.getEvents();
    _favoriteEventsState.value = favoriteEvents;
  }

  @override
  Future<void> navigateToDetail(BuildContext context, EventEntity event) async {
    final eventResult = await _service.getEvent(id: event.id);
    eventResult.when(
        success: (eventData) => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EventDetail(eventData.data))),
        error: (error) => print(error));
  }

  @override
  GenericState<List<EventEntity>> provideFavoriteEvents() => _favoriteEventsState;

  @override
  String provideEventImage(int index) {
    return _favoriteEventsState.value[index].url;
  }

  @override
  String provideEventName(int index) {
    return _favoriteEventsState.value[index].name;
  }
}
