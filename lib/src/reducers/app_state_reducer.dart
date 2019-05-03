import 'package:redux_architecture_sample/src/models/app_state.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
//      isLoading: loadingReducer(state.isLoading, action),
      theme: themeReducer(state.theme, action),
      isEnableDarkTheme: enableDarkTheme(state.isEnableDarkTheme, action));
}
