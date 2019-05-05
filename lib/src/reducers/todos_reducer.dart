import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

final todosReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<List<Todo>, TodosNotLoadedAction>(_setNoTodos),
]);

List<Todo> _setLoadedTodos(List<Todo> todos, TodosLoadedAction action){
  return action.todos;
}

List<Todo> _setNoTodos(List<Todo> todos, TodosNotLoadedAction action) => [];