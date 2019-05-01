import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, TodosLoadedAction>(_setLoaded),
  TypedReducer<bool, TodosNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}