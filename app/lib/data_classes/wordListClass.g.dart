// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordListClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordList _$WordListFromJson(Map<String, dynamic> json) {
  return WordList(
    symbol: json['symbol'] as String,
    location: json['location'] as String,
    wordList: (json['wordList'] as List)
        ?.map((e) =>
            e == null ? null : WordCard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WordListToJson(WordList instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'location': instance.location,
      'wordList': instance.wordList,
    };
