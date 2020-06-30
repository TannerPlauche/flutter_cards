import 'package:flashcard_app/data_classes/phonemeClass.dart';
import 'package:flashcard_app/widgets/wordListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationSelector extends StatefulWidget {
  final Phoneme selectedPhoneme;

  LocationSelector({@required this.selectedPhoneme});

  @override
  _LocationSelectorState createState() =>
      _LocationSelectorState(selectedPhoneme);
}

class _LocationSelectorState extends State<LocationSelector> {
  Phoneme selectedPhoneme;
  List<String> locations = ["Begining", "Middle", "End"];

  _LocationSelectorState(this.selectedPhoneme);

  void selectLocation(String location) {
    print('${location}, ${selectedPhoneme.symbol}');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WordListView(
              selectedPhoneme: selectedPhoneme, location: location)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection a postion ${selectedPhoneme.symbol}"),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: locations.map((location) {
            return GestureDetector(
              onTap: () {
                selectLocation(location.toLowerCase());
              },
              child: Container(
                margin: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsetsDirectional.fromSTEB(40, 10, 40, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal[200]),
                  child: Center(
                    child: Text(location,
                        style: TextStyle(
                          fontSize: 75.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
