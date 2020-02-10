import 'package:flutter/material.dart';
import 'package:ticketmaster/core/models/event.dart';
import 'package:ticketmaster/styles/textstyles.dart';
import 'package:ticketmaster/widgets/favorite_button.dart';
import 'package:ticketmaster/widgets/neumorph_widget.dart';

class ListItem extends StatelessWidget {
  final Event _event;
  final void Function() onPressed;

  ListItem(this._event, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //TODO: add to sizes
      padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16, bottom: 4.0),
      child: Container(
        child: GestureDetector(
          onTap: onPressed,
          child: NeuMorphWidget(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO: Add to sizes
                  NeuMorphWidget(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        _event.images
                            .firstWhere((image) => image.ratio == "16_9" && image.width > 1000)
                            .url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _event.name.toUpperCase(),
                    style: AppTextStyles.itemName,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_event.dates.start.localDate),
                      FavoriteButton(event: this._event),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
