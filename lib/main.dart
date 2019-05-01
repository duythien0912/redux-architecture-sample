import 'package:flutter/material.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/locale/delegates.dart';
import 'package:redux_architecture_sample/src/locale/locales.dart';
import 'package:redux_architecture_sample/src/locale/localizations.dart';
import 'package:redux_architecture_sample/src/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/reducers/app_state_reducer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appStore =
      Store<AppState>(appReducer, initialState: AppState.initial());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: appStore,
      /// Lately should use [StoreConnector] instead to gain better performance
      child: StoreBuilder<AppState>(
        builder: (context, store) {
          return MaterialApp(
            theme: appStore.state.isEnableDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
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
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Redux Architecture"),
        ),
        body: Center(
          child: Text(AppLocalizations.of(context).trans('hello_world')),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Dark Theme"),
                trailing: Switch(
                  value: StoreProvider.of<AppState>(context)
                      .state
                      .isEnableDarkTheme,
                  onChanged: (isChanged) {
                    StoreProvider.of<AppState>(context).dispatch(
                        isChanged == true
                            ? TurnOnDarkThemeAction()
                            : TurnOffDarkThemeAction());
                  },
                ),
              )
            ],
          ),
        ));
  }
}
