import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link {
  final String href;

  Link({@required this.href});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
