import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:todos_repository_simple/todos_repository_simple.dart';
import 'package:todos_repository_core/todos_repository_core.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/selectors/selectors.dart';

TodosRepository todosRepository = const TodosRepositoryFlutter(
  fileStorage: const FileStorage(
    '__redux_app__',
    getApplicationDocumentsDirectory,
  ),
);

List<Middleware<AppState>> createMiddleWares() {
  return [EpicMiddleware(_epic), LoggingMiddleware.printer()];
}

final _epic = combineEpics<AppState>([
  TypedEpic<AppState, LoadTodosAction>(_createLoadTodos),
  TypedEpic<AppState, AddTodoAction>(_createSaveTodos)
]);

Stream<dynamic> _createLoadTodos(
    Stream<LoadTodosAction> actions, EpicStore<AppState> store) {
  return Observable.fromFuture(todosRepository
          .loadTodos()
          .then((result) =>
              TodosLoadedAction(todos: result.map(Todo.fromEntity).toList()))
          .catchError((error) => TodosNotLoadedAction()))
      .takeUntil(
          actions.where((action) => action is CancelItemDataEventAction));
}

Stream<dynamic> _createSaveTodos(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions.asyncMap((_) => Observable.fromFuture(
          todosRepository.saveTodos(todosSelector(store.state)
              .map((todo) => todo.toEntity())
              .toList()))
      .takeUntil(
          actions.where((action) => action is CancelItemDataEventAction)));
}
