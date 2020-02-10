import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ticketmaster/core/models/classification.dart';
import 'package:ticketmaster/core/models/dates.dart';
import 'package:ticketmaster/core/models/image.dart';
import 'package:ticketmaster/core/models/price_range.dart';
import 'package:ticketmaster/core/models/promoter.dart';
import 'package:ticketmaster/core/models/seatmap.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String name;
  final String id;
  final String url;
  final Dates dates;
  final Promoter promoter;
  final String info;
  final String pleaseNote;
  final Seatmap seatmap;
  final List<Image> images;
  final List<Classification> classifications;
  final List<PriceRange> priceRanges;

  Event({
    @required this.name,
    @required this.id,
    @required this.url,
    @required this.dates,
    @required this.promoter,
    @required this.info,
    @required this.pleaseNote,
    @required this.seatmap,
    @required List<Image> images,
    @required List<Classification> classifications,
    @required List<PriceRange> priceRanges,
  })  : this.images = images ?? <Image>[],
        this.classifications = classifications ?? <Classification>[],
        this.priceRanges = priceRanges ?? <PriceRange>[];

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
