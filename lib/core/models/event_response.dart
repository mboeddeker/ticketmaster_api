import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ticketmaster/core/models/event_response_embedded.dart';
import 'package:ticketmaster/core/models/page.dart';
import 'package:ticketmaster/core/models/page_links.dart';

part 'event_response.g.dart';

@JsonSerializable()
class EventResponse {
  @JsonKey(name: '_embedded', nullable: false)
  final EventResponseEmbedded data;

  @JsonKey(name: '_links', nullable: false)
  final PageLinks links;

  @JsonKey(name: 'page', nullable: false)
  final Page pageInformations;

  EventResponse({@required this.data, @required this.links, @required this.pageInformations});

  factory EventResponse.fromJson(Map<String, dynamic> json) => _$EventResponseFromJson(json);
}
