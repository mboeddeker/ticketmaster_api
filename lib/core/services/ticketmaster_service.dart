import 'package:flutter/foundation.dart';
import 'package:ticketmaster/core/models/event.dart';
import 'package:ticketmaster/core/models/event_response.dart';
import 'package:ticketmaster/core/models/result.dart';
import 'package:ticketmaster/core/services/base_service.dart';
import 'package:ticketmaster/core/utils/env.dart';

class TicketMasterService {
  final BaseService service;

  TicketMasterService(this.service);

  Future<Result<EventResponse>> getEvents({int page = 0, int size = 20}) async {
    final String url =
        '${service.baseUrl}/discovery/v2/events.json?page=$page&size=$size&apikey=${Enviroment.apiKey}';
    try {
      final response = await service.dio.get(url);
      final eventsResponse = EventResponse.fromJson(response.data);
      return Result.success(data: eventsResponse, message: 'okay');
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }

  Future<Result<Event>> getEvent({@required String id}) async {
    final String url =
        '${service.baseUrl}/discovery/v2/events/$id.json?apikey=${Enviroment.apiKey}';
    try {
      final response = await service.dio.get(url);
      final eventsResponse = Event.fromJson(response.data);
      return Result.success(data: eventsResponse, message: 'okay');
    } catch (e) {
      return Result.error(message: e.toString());
    }
  }
}
