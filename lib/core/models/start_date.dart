import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_date.g.dart';

@JsonSerializable()
class StartDate {
  final String localDate;
  final String localTime;
  final String dateTime;
  final bool dateTbd;
  final bool dateTba;
  final bool timeTba;
  final bool noSpecificTime;

  StartDate({
    @required this.localDate,
    @required this.localTime,
    @required this.dateTime,
    @required this.dateTbd,
    @required this.dateTba,
    @required this.timeTba,
    @required this.noSpecificTime,
  });

  factory StartDate.fromJson(Map<String, dynamic> json) => _$StartDateFromJson(json);
}
