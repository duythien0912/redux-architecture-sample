import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/locale/locale_export.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class TodosPage extends StatelessWidget {
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
