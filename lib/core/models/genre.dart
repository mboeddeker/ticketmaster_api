import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final String id;
  final String name;

  Genre({
    @required this.id,
    @required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
