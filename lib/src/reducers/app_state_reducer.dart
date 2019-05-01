import 'package:redux_architecture_sample/src/models/app_state.dart';
import 'package:redux_architecture_sample/src/reducers/enable_dark_theme_reducer.dart';
import 'package:redux_architecture_sample/src/reducers/loading_reducer.dart';
import 'package:redux_architecture_sample/src/reducers/theme_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
//      isLoading: loadingReducer(state.isLoading, action),
      theme: themeReducer(state.theme, action),
      isEnableDarkTheme: enableDarkTheme(state.isEnableDarkTheme, action));
}
