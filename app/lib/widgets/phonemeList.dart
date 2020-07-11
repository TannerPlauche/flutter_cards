import 'package:flashcard_app/services/phoneme.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_app/data_classes/phonemeClass.dart';

// NOT USING THIS WIDGET
// THIS WAS A TEST
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

  Future<List<Phoneme>> getPhonemes() async {
//    debugPrint('getting phonems');
    Future<List<Phoneme>> phonemes = PhonemeService.getAllPhonemes();
//    debugPrint(phonemes.toString());

    return phonemes;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: FutureBuilder<List<Phoneme>>(
      future: getPhonemes(),
      builder: (context, snapshot) {
        print(snapshot.data != null ? snapshot.data.length : 'none');

        if (snapshot.data != null) {
          return Center(
              child: Column(children: [
            ListView.builder(
              itemCount: snapshot.data.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(snapshot.data[index].symbol));
              },
            ),
          ]));
        } else {
          return Container(
            child: FlatButton(
              child: Text('load'),
              onPressed: getPhonemes,
            ),
          );
        }
      },
    ));
  }
}
