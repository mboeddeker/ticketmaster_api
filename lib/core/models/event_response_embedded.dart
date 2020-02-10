import 'package:json_annotation/json_annotation.dart';
import 'package:ticketmaster/core/models/event.dart';

part 'event_response_embedded.g.dart';

@JsonSerializable()
class EventResponseEmbedded {
  List<Event> events;

  EventResponseEmbedded({List<Event> events}) : this.events = events ?? <Event>[];

  factory EventResponseEmbedded.fromJson(Map<String, dynamic> json) =>
      _$EventResponseEmbeddedFromJson(json);
}
