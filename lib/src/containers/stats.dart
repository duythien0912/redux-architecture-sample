import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Stats Page",
        key: Key("Stats text"),
      ),
    );
  }
}
