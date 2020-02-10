import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'package:ticketmaster/core/models/event_response.dart';

void main() {
  String jsonFile;

  setUp(() async {
    if (Directory.current.path.endsWith('/test')) {
      Directory.current = Directory.current.parent;
    }
    final file = File('test_resources/jsons/event_response.json');
    jsonFile = await file.readAsString();
  });

  tearDown(() {
    jsonFile = null;
  });

  test('testing correct model parsing', () {
    expect(jsonFile, isNotNull);

    final eventsResponse = EventResponse.fromJson(jsonDecode(jsonFile));
    expect(eventsResponse, isNotNull);
    expect(eventsResponse.data.events.length, equals(20));
  });
}
