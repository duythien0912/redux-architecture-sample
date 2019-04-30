import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String RESOURCE = 'lib/src/locale/lang/';

class AppLocalizations {
  final Locale locale;

  AppLocalizations({this.locale});

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  Map<String, String> _sentences;

  Future<bool> load() async {
    String data = await rootBundle
        .loadString(RESOURCE + '${this.locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  String trans(String key) {
    return this._sentences[key];
  }
}
