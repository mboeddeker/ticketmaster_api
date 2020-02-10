import 'package:flutter/material.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/core/models/event.dart';
import 'package:ticketmaster/core/services/ticketmaster_service.dart';
import 'package:ticketmaster/core/utils/generic_state.dart';
import 'package:ticketmaster/use_cases/eventdetail/event_detail.dart';

abstract class Input {
  Future<void> initialize();
  Future<bool> loadNextEntries();
  Future<void> refresh();
  onEventClicked(BuildContext context, Event event);
  dispose();
}

abstract class Output {
  GenericState<List<Event>> provideEvents();
  GenericState<int> providePresentItemsCount();
  ScrollController controller;
}

class EventsListViewModel implements Input, Output {
  final _ticketMasterService = inject<TicketMasterService>();

  int _currentPage = 0;
  bool isLoadingEntries = false;

  GenericState<List<Event>> _eventsState = GenericState.initWith([]);
  GenericState<int> _itemCountState = GenericState.initWith(0);

  @override
  Future initialize() async {
    _initializeScrollController();
    await _loadEvents();
  }

  @override
  Future<bool> loadNextEntries() async {
    _currentPage += 1;
    await _loadEvents();
    return true;
  }

  @override
  Future<void> refresh() async {
    _currentPage = 0;
    _eventsState.value = [];
    await _loadEvents();
  }

  @override
  onEventClicked(BuildContext context, Event event) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetail(event)));
  }

  @override
  GenericState<List<Event>> provideEvents() => _eventsState;

  @override
  GenericState<int> providePresentItemsCount() => _itemCountState;

  @override
  ScrollController controller = ScrollController(keepScrollOffset: true);

  void _initializeScrollController() {
    controller.addListener(() async {
      if (controller.offset == controller.position.maxScrollExtent) {
        await loadNextEntries();
      }
    });
  }

  Future _loadEvents() async {
    if (!isLoadingEntries) {
      isLoadingEntries = true;
      await Future.delayed(Duration(seconds: 1));
      final response = await _ticketMasterService.getEvents(page: _currentPage);
      response.when(
        success: (responseData) {
          _eventsState.value += responseData.data.data.events;

          isLoadingEntries = false;
        },
        error: (e) => print('Error ${e.toString()}'),
      );
    }
  }

  @override
  dispose() {
    _eventsState.dispose();
    _itemCountState.dispose();
    controller.dispose();
  }
}
