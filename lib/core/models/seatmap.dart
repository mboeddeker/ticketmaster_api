import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seatmap.g.dart';

@JsonSerializable()
class Seatmap {
  final String staticUrl;

  Seatmap({
    @required this.staticUrl,
  });

  factory Seatmap.fromJson(Map<String, dynamic> json) => _$SeatmapFromJson(json);
}
