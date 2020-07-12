// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phonemeClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phoneme _$PhonemeFromJson(Map<String, dynamic> json) {
  return Phoneme(
    symbol: json['symbol'] as String,
    letter: json['letter'] as String,
  );
}

Map<String, dynamic> _$PhonemeToJson(Phoneme instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'letter': instance.letter,
    };
