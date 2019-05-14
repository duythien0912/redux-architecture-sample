import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/view/views.dart';

import '../containers.dart';

class FilteredTodos extends StatelessWidget {
  FilteredTodos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilteredTodosViewModel>(
      converter: (Store<AppState> store) =>
          FilteredTodosViewModel.fromStore(store),
      builder: (context, viewModel) {
        return TodoList(
          todos: viewModel.todos,
        );
      },
    );
  }
}
