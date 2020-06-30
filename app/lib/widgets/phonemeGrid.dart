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
  final List<Phoneme> phonemes = PhonemeService.getStaticPhonemes();

  void selectPhoneme(Phoneme phoneme) {
    print(phoneme.symbol);
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
    return Expanded(
      child: SizedBox(
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: phonemes.map((phoneme) {
              return GestureDetector(
                onTap: () {
                  selectPhoneme(phoneme);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      phoneme.symbol,
                      style: TextStyle(
                        fontSize: 75.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
//                color: Colors.teal[100],
                  decoration: BoxDecoration(
                    color: Colors.teal[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
