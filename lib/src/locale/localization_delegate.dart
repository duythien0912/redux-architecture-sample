import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux_architecture_sample/src/locale/localizations.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['vi', 'en'].contains(locale.languageCode);

  /// Start loading the resources for `locale`. The returned future completes
  /// when the resources have finished loading.
  ///
  /// It's assumed that the this method will return an object that contains
  /// a collection of related resources (typically defined with one method per
  /// resource). The object will be retrieved with [Localizations.of].
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale: locale);
    await appLocalizations.load();
    print("Load ${locale.languageCode}");
    return appLocalizations;
  }

  /// Returns true if the resources for this delegate should be loaded
  /// again by calling the [load] method.
  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
