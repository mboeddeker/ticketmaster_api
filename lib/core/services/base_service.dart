import 'package:dio/dio.dart';

class BaseService {
  /// Dio Client
  Dio dio = Dio();

  /// Itunes BaseUrl 'https://itunes.apple.com/'
  String baseUrl = 'https://app.ticketmaster.com';

  BaseService();
}
