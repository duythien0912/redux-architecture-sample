import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/locale/locale_export.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/routes/routes.dart';
import 'package:redux_architecture_sample/src/routes/route_generator.dart';

class HomePage extends StatelessWidget {
  final Store<AppState> store;

  const HomePage({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, bool>(
        distinct: true,
        converter: (Store<AppState> store) => store.state.isEnableDarkTheme,
        builder: (context, isEnableDarkTheme) {
          return MaterialApp(
            theme: isEnableDarkTheme ? ThemeData.dark() : ThemeData.light(),
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
            initialRoute: ArchRoutes.todosPage,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
