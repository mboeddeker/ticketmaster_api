import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promoter.g.dart';

@JsonSerializable()
class Promoter {
  final String id;
  final String name;
  final String description;

  Promoter({
    @required this.id,
    @required this.name,
    @required this.description,
  });

  factory Promoter.fromJson(Map<String, dynamic> json) => _$PromoterFromJson(json);
}
