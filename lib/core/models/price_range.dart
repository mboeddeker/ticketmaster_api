import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_range.g.dart';

@JsonSerializable()
class PriceRange {
  final String currency;
  final double min;
  final double max;

  PriceRange({
    @required this.currency,
    @required this.min,
    @required this.max,
  });

  factory PriceRange.fromJson(Map<String, dynamic> json) => _$PriceRangeFromJson(json);
}
