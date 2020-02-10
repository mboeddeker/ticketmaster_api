import 'package:ticketmaster/core/database/daos/event_dao.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/core/utils/generic_state.dart';

class TicketMasterAppState {
  final _dao = inject<EventDao>();
  GenericState<int> _favoriteNumber = GenericState.initWith(0);

  GenericState<int> provideFavoriteNumber() => _favoriteNumber;

  static Future<TicketMasterAppState> initializeAppState() async {
    final state = TicketMasterAppState();
    await state.loadFavorites();

    return state;
  }

  Future loadFavorites() async {
    final favoriteList = await _dao.getEvents();
    _favoriteNumber.value = favoriteList.length;
  }
}
