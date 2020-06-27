import 'package:flashcard_app/services/phoneme.service.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_app/data_classes/phonemeClass.dart';

class PhonemeList extends StatefulWidget {
  @override
  _PhonemeListState createState() => _PhonemeListState();
}

class _PhonemeListState extends State<PhonemeList> {
  Future<List<Phoneme>> phonemes;

  @override
  void initState() {
    super.initState();
    this.getPhonemes();
  }

  void getPhonemes() {
    debugPrint('getting phonems');
    Future<List<Phoneme>> phonemes = PhonemeService.getAllPhonemes();
    debugPrint(phonemes.toString());
    this.setState(() {
      this.phonemes = phonemes;
    });
  }

  Widget renderPhonemes(AsyncSnapshot snapshot) {
    debugPrint('*********************************');
    debugPrint(snapshot.connectionState.toString());
    debugPrint(snapshot.hasData.toString());

    if (snapshot.connectionState == ConnectionState.none &&
        snapshot.hasData == null) {
      return Container();
    }

    if (snapshot.hasData) {
      return SingleChildScrollView(
          child: ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          Phoneme phoneme = snapshot.data[index];
          return Column(
            children: <Widget>[
              Text(phoneme.symbol)
              // Widget to display the list of phoneme
            ],
          );
        },
      ));
    } else {
      return Container(
        child: FlatButton(
          child: Text('load'),
          onPressed: getPhonemes,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: FutureBuilder<List<Phoneme>>(
      future: phonemes,
      builder: (context, snapshot) {
        return this.renderPhonemes(snapshot);
      },
    ));
  }
}
