import 'package:flashcard_app/data_classes/phonemeClass.dart';
import 'package:flashcard_app/data_classes/wordListClass.dart';
import 'package:flashcard_app/services/wordList.service.dart';
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
  Future<WordList> wordList;

  _WordListViewState(this.selectedPhoneme, this.location);

  @override
  void initState() {
    super.initState();
    wordList = getWordList();
  }

  Future<WordList> getWordList() {
    Future<WordList> futureWordList =
        WordListService.getAllWordList(selectedPhoneme.symbol, location);
    return futureWordList;
  }

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
              FutureBuilder(
                  future: wordList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
//                      return Text('got data');
                      return Center(
                        child: Container(
                          margin: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                          width: 300,
                          child: Column(
                            children: <Widget>[
                              Image.network(snapshot.data.wordList[1].imageUrl),
                              Text(snapshot.data.wordList[1].word)
                            ],
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
