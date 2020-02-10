import 'package:flutter/foundation.dart';
import 'package:ticketmaster/core/models/event.dart';

abstract class Input {}

abstract class Output {
  String provideImageUrl();
  String provideEventName();
  String provideEventDescription();
  String provideEventDate();
  String provideEventId();
}

class EventDetailViewModel implements Input, Output {
  final Event event;

  EventDetailViewModel({@required this.event});

  @override
  String provideEventDate() {
    return event.dates.start.localDate;
  }

  @override
  String provideEventDescription() {
    return event.info ?? '';
  }

  @override
  String provideEventName() {
    return event.name;
  }

  @override
  String provideImageUrl() {
    return event.images.firstWhere((image) => image.ratio == "16_9" && image.width > 1000).url;
  }

  @override
  String provideEventId() {
    return event.id;
  }
}
