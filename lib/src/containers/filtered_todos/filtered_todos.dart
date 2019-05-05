import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/presentation/presentation.dart';

import '../containers.dart';

class FilteredTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilteredTodosViewModel>(
      converter: (Store<AppState> store) => FilteredTodosViewModel.fromStore(store),
      builder: (context, viewModel){
        return TodoList(
          todos: viewModel.todos,
        );
      },
    );
  }
}
