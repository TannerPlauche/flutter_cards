import 'package:flashcard_app/data_classes/phonemeClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordListView extends StatefulWidget {
  final String location;
  final Phoneme selectedPhoneme;

  WordListView({@required this.selectedPhoneme, @required this.location});

  @override
  _WordListViewState createState() =>
      _WordListViewState(selectedPhoneme, location);
}

class _WordListViewState extends State<WordListView> {
  final String location;
  final Phoneme selectedPhoneme;

  _WordListViewState(this.selectedPhoneme, this.location);

  void navigateHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: navigateHome,
          child: Icon(Icons.arrow_back_ios),
        ),
        title:
            Text("Words ${selectedPhoneme.symbol} at the $location location"),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text("Phoneme: ${selectedPhoneme.symbol}"),
              ),
              Text("location: $location"),
            ],
          ),
        ),
      ),
    );
  }
}
