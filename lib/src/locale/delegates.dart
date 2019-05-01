import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:redux_architecture_sample/src/locale/localization_delegate.dart';

const List<LocalizationsDelegate<dynamic>> delegates = [
  const AppLocalizationDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];
