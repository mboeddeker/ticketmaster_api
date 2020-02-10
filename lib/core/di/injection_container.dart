import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ticketmaster/core/database/daos/event_dao.dart';
import 'package:ticketmaster/core/database/database_provider.dart';
import 'package:ticketmaster/core/services/base_service.dart';
import 'package:ticketmaster/core/services/ticketmaster_service.dart';

class InjectionContainer {
  static void setup() {
    final container = Container();

    container.registerInstance(BaseService());

    container.registerFactory((factory) => TicketMasterService(inject<BaseService>()));

    container.registerFactory((factory) => DataBaseProvider());

    container.registerFactory((factory) => EventDao(dataBaseProvider: inject<DataBaseProvider>()));
  }
}

T inject<T>() {
  var obj = Container().resolve<T>();
  if (kDebugMode) {
    print('DI: Type=${obj.runtimeType.toString()}, hashCode=${obj.hashCode}');
  }
  return obj;
}
