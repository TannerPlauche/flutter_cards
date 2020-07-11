class WordCard {
  String word;
  String imageUrl;

  WordCard({this.word, this.imageUrl});

  factory WordCard.fromJson(Map<String, dynamic> wordCardJson) {
    print('creating card ${wordCardJson['word']}');
    print('creating card ${wordCardJson['imageUrl']}');
    return WordCard(
        word: wordCardJson['word'], imageUrl: wordCardJson['imageUrl']);
  }
}
