import 'dart:convert';

import 'package:flashcard_app/data_classes/phonemeClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PhonemeService {
  static List<Map> PHONEME_LIST = [
    {'symbol': 'a', 'letter': 'a'},
    {'symbol': 'b', 'letter': 'b'},
    {'symbol': 'd', 'letter': 'd'},
    {'symbol': 'e', 'letter': 'e'},
    {'symbol': 'f', 'letter': 'f'},
    {'symbol': 'f', 'letter': 'f'},
    {'symbol': 'g', 'letter': 'g'},
    {'symbol': 'h', 'letter': 'h'},
    {'symbol': 'i', 'letter': 'i'},
    {'symbol': 'j', 'letter': 'j'},
    {'symbol': 'k', 'letter': 'k'},
    {'symbol': 'l', 'letter': 'l'},
    {'symbol': 'm', 'letter': 'm'},
    {'symbol': 'n', 'letter': 'n'},
    {'symbol': 'o', 'letter': 'o'},
    {'symbol': 'p', 'letter': 'p'},
  ];

  static List<Phoneme> getStaticPhonemes() {
    return PHONEME_LIST
        .map((phoneme) =>
            new Phoneme(symbol: phoneme['symbol'], letter: phoneme['letter']))
        .toList();
  }

  static Future<List<Phoneme>> getAllPhonemes() async {
    final response = await http.get('http://localhost:3000/phoneme');

    if (response.statusCode == 200) {
      var phonemes = json.decode(response.body);
      List<Phoneme> phonemeList = [];

      for (var p in phonemes) {
        var newPhoneme = new Phoneme(symbol: p["symbol"], letter: p["letter"]);
        phonemeList.add(newPhoneme);
      }
//      print(phonemeList.length);
      return phonemeList;
//      return phonemes.map((phoneme) => Phoneme.fromJson(phoneme)).toList();
    } else {
      throw Exception('Failed to fetch phoneme data');
    }
  }
}
