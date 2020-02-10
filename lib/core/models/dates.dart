import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ticketmaster/core/models/start_date.dart';

part 'dates.g.dart';

@JsonSerializable()
class Dates {
  final StartDate start;
  final String timezone;

  Dates({
    @required this.start,
    @required this.timezone,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}
