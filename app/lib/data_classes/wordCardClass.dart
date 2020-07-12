import 'package:json_annotation/json_annotation.dart';

part 'wordCardClass.g.dart';

@JsonSerializable()
class WordCard {
  String word;
  String imageUrl;

  WordCard({this.word, this.imageUrl});

  factory WordCard.fromJson(Map<String, dynamic> json) =>
      _$WordCardFromJson(json);
}
