import 'package:flutter/material.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/middleware/todos_middleware.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/presentation/home_page.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';

import 'src/locale/locale_export.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final appStore = Store<AppState>(
      appReducer,
      distinct: true,
      initialState: AppState.loading(),
      middleware: createMiddleWares());

  @override
  Widget build(BuildContext context) {
    return HomePage(store: appStore);
  }
}
