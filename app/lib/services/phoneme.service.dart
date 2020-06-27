import 'dart:convert';

import 'package:flashcard_app/data_classes/phonemeClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PhonemeService {
  static Future<List<Phoneme>> getAllPhonemes() async {
    debugPrint(' GETTING PHONEMESEDSSSS');
    final response = await http.get('http://localhost:3000/phoneme');
    if (response.statusCode == 200) {
      debugPrint(json.decode('body' + response.body.toString()));
      var phonemes = json.decode(response.body);
      return phonemes.map((phoneme) => Phoneme.fromJson(phoneme)).toList();
    } else {
      debugPrint('No data');
      throw Exception('Failed to fetch phoneme data');
    }
  }
}
