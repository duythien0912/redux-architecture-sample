import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action),
      todos: todosReducer(state.todos, action),
      theme: themeReducer(state.theme, action),
      activeTab: tabsReducer(state.activeTab, action),
      isEnableDarkTheme: enableDarkTheme(state.isEnableDarkTheme, action));
}
