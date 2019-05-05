import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class FilteredTodosViewModel extends Equatable {
  final List<Todo> todos;
  final bool loading;

  FilteredTodosViewModel({this.todos, this.loading}) : super([todos, loading]);

  static FilteredTodosViewModel fromStore(Store<AppState> store) {
    return FilteredTodosViewModel(
        todos: store.state.todos,
        loading: store.state.isLoading
    );
  }
}
