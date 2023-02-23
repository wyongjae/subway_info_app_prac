import 'package:freezed_annotation/freezed_annotation.dart';

part 'subway.freezed.dart';

part 'subway.g.dart';

@freezed
class Subway with _$Subway {
  factory Subway({
    required String arvlMsg2,
    required String trainLineNm,
  }) = _Subway;

  factory Subway.fromJson(Map<String, dynamic> json) => _$SubwayFromJson(json);
}
