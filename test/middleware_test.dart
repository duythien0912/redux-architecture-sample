import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/middleware/middlewares.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:todos_repository_core/todos_repository_core.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';

class MockTodosRepository extends Mock implements TodosRepository{}

main() {
  group("Middleware State", () {
    test("should load the todos in response to a LoadTodosAction", () {
      final repository = MockTodosRepository();
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.loading(),
        middleware: createMiddleWares(repository),
      );

      final todos = [
        TodoEntity("Moin", "1", "Note", false),
      ];

      when(repository.loadTodos()).thenAnswer((_) => Future.value(todos));

      store.dispatch(LoadTodosAction());

      verify(repository.loadTodos());
    });
  });
}
