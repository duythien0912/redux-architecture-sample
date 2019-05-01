import 'package:flutter/material.dart';

class TodosLoadedAction {}

class TodosNotLoadedAction {}

class ChangeAppTheme {
  final ThemeData themeData;

  ChangeAppTheme({@required this.themeData});

  @override
  String toString() {
    return 'ChangeAppTheme: ${this.themeData}';
  }
}

class TurnOnDarkThemeAction {}

class TurnOffDarkThemeAction{}
