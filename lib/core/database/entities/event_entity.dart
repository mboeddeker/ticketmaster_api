import 'package:ticketmaster/core/models/event.dart';

class EventEntity {
  String id;
  String name;
  String url;
  String date;

  EventEntity({this.id, this.name, this.url, this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'date': date,
    };
  }

  EventEntity.fromEvent(Event event) {
    id = event.id;
    name = event.name;
    url = event.images.firstWhere((image) => image.ratio == "16_9" && image.width > 1000).url;
    date = event.dates.start.localDate;
  }

  EventEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    date = map['date'];
  }
}
