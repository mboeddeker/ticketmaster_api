import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ticketmaster/core/models/link.dart';

part 'page_links.g.dart';

@JsonSerializable()
class PageLinks {
  final Link first;

  final Link self;

  final Link next;

  final Link last;

  PageLinks({
    @required this.first,
    @required this.self,
    @required this.next,
    @required this.last,
  });

  factory PageLinks.fromJson(Map<String, dynamic> json) => _$PageLinksFromJson(json);
}
