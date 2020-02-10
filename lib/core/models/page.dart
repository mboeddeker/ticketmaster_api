import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Page {
  final int size;

  final int totalElements;

  final int totalPages;

  @JsonKey(name: 'number')
  final int pageNumber;

  Page({
    @required this.size,
    @required this.totalElements,
    @required this.totalPages,
    @required this.pageNumber,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}
