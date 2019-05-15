import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/containers/app_loading.dart';
import 'package:redux_architecture_sample/src/middleware/middlewares.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';
import 'package:redux_architecture_sample/src/selectors/selectors.dart';
import 'package:redux_architecture_sample/src/view/views.dart';
import 'package:todos_repository_core/src/todo_entity.dart';
import 'package:todos_repository_core/src/todos_repository.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

main() {
  group("TodoList test", () {
    Widget makeTestableWidget({Widget child, Store<AppState> store}) {
      return StoreProvider<AppState>(
        store: store,
        child: child,
      );
    }

    final mockRepo = MockTodosRepository();

    final appStore = Store<AppState>(appReducer,
        initialState: AppState.loading(),
        middleware: createMiddleWares(mockRepo));

    final todosEntity = [
      TodoEntity("Moin", "1", "Note", false),
    ];

    when(mockRepo.loadTodos()).thenAnswer((_) => Future.value(todosEntity));

    appStore.dispatch(LoadTodosAction());

    final todos = [
      Todo.fromEntity(TodoEntity("Moin", "1", "Note", false)),
    ];

    testWidgets("Don't show loading indicator when dispatch LoadTodosAction",
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(
          store: appStore,
          child: MaterialApp(
            home: Scaffold(
              body: TodoList(todos: todos),
            ),
          )));

      await tester.pumpAndSettle(Duration(milliseconds: 500));
      expect(find.byKey(Key("LoadingIndicator")), findsNothing);
    });
  });
}
