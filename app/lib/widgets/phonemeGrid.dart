import 'package:flashcard_app/data_classes/phonemeClass.dart';
import 'package:flashcard_app/services/phoneme.service.dart';
import 'package:flashcard_app/widgets/locationSelector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhonemeGrid extends StatefulWidget {
  @override
  _PhonemeGridState createState() => _PhonemeGridState();
}

class _PhonemeGridState extends State<PhonemeGrid> {
  Future<List<Phoneme>> phonemes;

  @override
  void initState() {
    super.initState();
    phonemes = getPhonemes();
  }

  Future<List<Phoneme>> getPhonemes() async {
    Future<List<Phoneme>> phonemes = PhonemeService.getAllPhonemes();
    return phonemes;
  }

  void selectPhoneme(Phoneme phoneme) {
//    print(phoneme.symbol);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationSelector(
                selectedPhoneme: phoneme,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: phonemes,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Expanded(
              child: SizedBox(
                child: GridView.builder(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    itemCount: snapshot.data.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          selectPhoneme(snapshot.data[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              snapshot.data[index].symbol,
                              style: TextStyle(
                                fontSize: 75.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
//                          color: ThemeData.light(Colors.teal),
                          decoration: BoxDecoration(
                            color: Colors.teal[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    }),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
