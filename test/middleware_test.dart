import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/middleware/middlewares.dart';
import 'package:redux_architecture_sample/src/middleware/todos_epic.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todos_repository_core/todos_repository_core.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';
import 'package:rxdart/rxdart.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

main() {
  group("createLoadTodos Epic", () {
    test(
        "dispatches the TodosLoadedAction action when LoadTodosAction is called and return Todo list",
        () {
      final repository = MockTodosRepository();
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.loading(),
        middleware: createMiddleWares(repository),
      );

      final epicStore = EpicStore(store);
      final Stream<LoadTodosAction> action = BehaviorSubject();

      final todosEpic = TodosEpic(repository);

      final todos = [
        TodoEntity("Moin", "1", "Note", false),
      ];

      when(repository.loadTodos()).thenAnswer((_) => Future.value(todos));

      todosEpic
          .createLoadTodos(action, epicStore)
          .listen((actual) => expect(actual, TodosLoadedAction(todos: todos.map(Todo.fromEntity).toList())));
    });
  });
}
