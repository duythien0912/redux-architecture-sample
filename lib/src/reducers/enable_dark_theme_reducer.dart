import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';

final enableDarkTheme = combineReducers<bool>([
  TypedReducer<bool, TurnOnDarkThemeAction>(_setEnableDarkTheme),
  TypedReducer<bool, TurnOffDarkThemeAction>(_setDisableDarkTheme)
]);

bool _setEnableDarkTheme(bool state, dynamic action) => true;

bool _setDisableDarkTheme(bool state, dynamic action) => false;
