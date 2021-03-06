import 'package:super_enum/super_enum.dart';

part "result.g.dart";

@superEnum
enum _Result {
  @generic
  @Data(fields: [
    DataField<Generic>('data'),
    DataField<String>('message'),
  ])
  Success,

  @Data(fields: [DataField<String>('message')])
  Error,
}
