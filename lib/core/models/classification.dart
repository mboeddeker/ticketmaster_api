import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ticketmaster/core/models/genre.dart';

part 'classification.g.dart';

@JsonSerializable()
class Classification {
  final bool primary;
  final Genre segment;
  final Genre genre;
  final Genre subGenre;
  final Genre type;
  final Genre subType;
  final bool family;

  Classification({
    @required this.primary,
    @required this.segment,
    @required this.genre,
    @required this.subGenre,
    @required this.type,
    @required this.subType,
    @required this.family,
  });

  factory Classification.fromJson(Map<String, dynamic> json) => _$ClassificationFromJson(json);
}
