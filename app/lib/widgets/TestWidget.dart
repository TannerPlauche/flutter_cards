import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  final String text = 'This is a child widget';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Text('$text'),
        Text('$text'),
        Text('$text'),
      ],
    );
  }
}
