import 'package:json_annotation/json_annotation.dart';
import 'package:flashcard_app/data_classes/wordCardClass.dart';

part 'wordListClass.g.dart';

@JsonSerializable()
class WordList {
  String symbol;
  String location;
  List<WordCard> wordList;

  WordList({this.symbol, this.location, this.wordList});

  factory WordList.fromJson(Map<String, dynamic> wordListJson) =>
      _$WordListFromJson(wordListJson);

  @override
  String toString() {
    return wordList[0].word;
  }
}
