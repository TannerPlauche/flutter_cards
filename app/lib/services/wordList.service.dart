import 'dart:convert';
import 'package:flashcard_app/data_classes/wordListClass.dart';
import 'package:http/http.dart' as http;

class WordListService {
  static Future<WordList> getAllWordList(String symbol, String location) async {
    String url =
        'http://localhost:3000/wordlist/symbol/$symbol/location/$location';
    final response = await http.get(url);
    // .get('http://10.0.2.2:3000/phoneme/symbol/$symbol/location/$location');

    if (response.statusCode == 200) {
      var wordListJSON = json.decode(response.body);

      var newWordList = WordList.fromJson(wordListJSON);

      return newWordList;
    } else {
      throw Exception('Failed to fetch wordlist data');
    }
  }
}
