class Phoneme {
  String symbol;
  String letter;

  Phoneme({this.symbol, this.letter});

  factory Phoneme.fromJson(Map<String, dynamic> phonemeJson) {
    return Phoneme(
        symbol: phonemeJson['symbol'], letter: phonemeJson['letter']);
  }
}
