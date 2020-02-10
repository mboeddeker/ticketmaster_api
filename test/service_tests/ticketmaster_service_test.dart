import 'dart:io';

import 'package:test/test.dart';

import 'package:ticketmaster/core/services/ticketmaster_service.dart';

import '../utils/mockbaseservice.dart';

void main() {
  TicketMasterService service;

  setUpAll(() {
    if (Directory.current.path.endsWith('/test')) {
      Directory.current = Directory.current.parent;
    }
    service = TicketMasterService(MockBaseService());
  });

  test('Loading EventsResponse', () async {
    final result = await service.getEvents();
    result.when(success: (resultData) {
      expect(resultData.data, isNotNull);
      expect(resultData.message, equals('okay'));
    }, error: (err) {
      fail(err.toString());
    });
  });

  test('Loading Single Event', () async {
    final result = await service.getEvent(id: 'randomId');
    result.when(success: (resultData) {
      expect(resultData.data, isNotNull);
      expect(resultData.message, equals('okay'));
    }, error: (err) {
      fail(err.toString());
    });
  });

  test('Loading Single Event error', () async {
    final result = await service.getEvent(id: 'unknownID');
    result.when(success: (resultData) {
      expect(resultData.data, isNull);
    }, error: (err) {
      expect(err.message, equals('DioError [DioErrorType.RESPONSE]: Http status error [404]'));
    });
  });
}
