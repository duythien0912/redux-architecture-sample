import 'package:redux_architecture_sample/src/models/models.dart';

List<Todo> todosSelector(AppState state) => state.todos;

bool isLoadingSelector(AppState state) => state.isLoading;