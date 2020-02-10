import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class MockAdapter extends HttpClientAdapter {
  static const String mockHost = "app.ticketmaster.com";
  static const String mockBase = "https://app.ticketmaster.com";

  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }

  @override
  Future<ResponseBody> fetch(
      RequestOptions options, Stream<List<int>> requestStream, Future cancelFuture) async {
    Uri uri = options.uri;

    if (uri.host == mockHost) {
      switch (uri.path) {
        case '/discovery/v2/events.json':
          var eventsJsonFile = File('test_resources/jsons/event_response.json');
          var eventsJsonString = await eventsJsonFile.readAsString();
          return ResponseBody.fromString(
            eventsJsonString,
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
        case '/discovery/v2/events/randomId.json':
          var eventsJsonFile = File('test_resources/jsons/singleevent_response.json');
          var eventsJsonString = await eventsJsonFile.readAsString();
          return ResponseBody.fromString(
            eventsJsonString,
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );

        default:
          return ResponseBody.fromString("", 404);
      }
    }
  }
}
