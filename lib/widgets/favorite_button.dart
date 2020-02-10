import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/core/database/daos/event_dao.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/core/models/event.dart';
import 'package:ticketmaster/ticketmaster_app_state.dart';
import 'package:ticketmaster/widgets/neumorph_widget.dart';

class FavoriteButton extends StatefulWidget {
  final double size;
  final Icon favoriteIcon;
  final Icon defaultIcon;
  final Event event;

  FavoriteButton({
    this.size = 35,
    this.favoriteIcon = const Icon(Icons.favorite, color: Colors.red),
    this.defaultIcon = const Icon(Icons.favorite_border, color: Colors.black),
    @required this.event,
  });

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite;
  TicketMasterAppState _appState;

  final _dao = inject<EventDao>();

  Future<bool> checkIsFavorite() async {
    return _dao.isFavorite(widget.event.id);
  }

  Future toggleFavorite() async {
    if (await _dao.isFavorite(widget.event.id)) {
      await _dao.removeEvent(widget.event.id);
    } else {
      await _dao.saveEvent(widget.event);
    }

    await _appState.loadFavorites();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<TicketMasterAppState>(context);
    return GestureDetector(
      onTap: () => toggleFavorite(),
      child: FutureBuilder(
        future: checkIsFavorite(),
        initialData: false,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return NeuMorphWidget.buildRoundMorph(context,
                icon: snapshot.data ?? false ? widget.favoriteIcon : widget.defaultIcon,
                size: widget.size);
          }
          return NeuMorphWidget.buildRoundMorph(context,
              icon: widget.defaultIcon, size: widget.size);
        },
      ), //NeuMorphWidget.buildRoundMorph(context, icon: , size: 35),
    );
  }
}
