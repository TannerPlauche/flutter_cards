import 'package:flashcard_app/data_classes/WordCardClass.dart';

class WordList {
  String symbol;
  String location;
  List<WordCard> wordList;

  WordList({this.symbol, this.location, this.wordList});

  factory WordList.fromJson(Map<String, dynamic> wordListJson) {
//    List<WordCard> wordCards = [];
//    for (var wordCardJson in wordListJson['wordList']) {
//      var newWordCard = new WordCard.fromJson(wordCardJson);
//      wordCards.add(newWordCard);
//    }

    WordList wordList = new WordList(
        symbol: wordListJson['symbol'],
        location: wordListJson['location'],
//        wordList: wordCards);
        wordList: (wordListJson['wordList'] as List)
            .map((wordCardJson) => new WordCard.fromJson(wordCardJson))
            .toList());
    return wordList;
  }

  @override
  String toString() {
    return wordList[0].word;
  }
}
