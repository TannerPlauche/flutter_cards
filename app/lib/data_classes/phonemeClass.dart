import 'package:json_annotation/json_annotation.dart';

part 'phonemeClass.g.dart';

@JsonSerializable()
class Phoneme {
  String symbol;
  String letter;

  Phoneme({this.symbol, this.letter});

  factory Phoneme.fromJson(Map<String, dynamic> json) =>
      _$PhonemeFromJson(json);

  Map<String, dynamic> toJson() => _$PhonemeToJson(this);
}
