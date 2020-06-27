import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;

class Phoneme {
  String symbol;
  String letter;

  Phoneme({this.symbol, this.letter});

  factory Phoneme.fromJson(Map<String, dynamic> phonemeJson) {
    debugPrint('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    debugPrint(phonemeJson.toString());

    return Phoneme(
        symbol: phonemeJson['symbol'], letter: phonemeJson['letter']);
  }
}
