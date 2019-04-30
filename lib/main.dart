import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:redux_architecture_sample/src/locale/localization_delegate.dart';
import 'package:redux_architecture_sample/src/locale/localizations.dart';

void main() => runApp(MyApp());

const List<Locale> locales = [
  const Locale('en', 'US'),
  const Locale('vi', 'VN')
];

const List<LocalizationsDelegate<dynamic>> delegates = [
  const AppLocalizationDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: locales,
      localizationsDelegates: delegates,
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context).trans('hello_world')),
      ),
    );
  }
}
