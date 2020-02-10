import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  final String ratio;
  final String url;
  final int width;
  final int height;
  final String attribution;

  Image({
    @required this.ratio,
    @required this.url,
    @required this.width,
    @required this.height,
    @required this.attribution,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
