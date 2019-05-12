import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/presentation/home_page.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';
import 'package:todos_repository_simple/todos_repository_simple.dart';
import 'package:todos_repository_core/todos_repository_core.dart';
import 'package:path_provider/path_provider.dart';

import 'src/middleware/middlewares.dart';

final todosRepository = const TodosRepositoryFlutter(
  fileStorage: const FileStorage(
    '__redux_app__',
    getApplicationDocumentsDirectory,
  ),
);

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final appStore = Store<AppState>(appReducer,
      initialState: AppState.loading(),
      middleware: createMiddleWares(todosRepository));

  @override
  Widget build(BuildContext context) {
    return HomePage(store: appStore);
  }
}
