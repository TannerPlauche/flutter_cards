// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordCardClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordCard _$WordCardFromJson(Map<String, dynamic> json) {
  return WordCard(
    word: json['word'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$WordCardToJson(WordCard instance) => <String, dynamic>{
      'word': instance.word,
      'imageUrl': instance.imageUrl,
    };
