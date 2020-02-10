import 'package:dio/dio.dart';
import 'package:ticketmaster/core/services/base_service.dart';

import 'mock_adapter.dart';

class MockBaseService extends BaseService {
  @override
  Dio dio = Dio();

  @override
  String get baseUrl => MockAdapter.mockBase;

  MockBaseService() {
    dio.httpClientAdapter = MockAdapter();
  }
}
