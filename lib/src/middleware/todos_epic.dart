import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:todos_repository_core/todos_repository_core.dart';

class TodosEpic {
  TodosRepository todosRepository;

  TodosEpic(this.todosRepository);

  Epic<AppState> epics() => combineEpics<AppState>(
      [TypedEpic<AppState, LoadTodosAction>(createLoadTodos)]);

  Stream<dynamic> createLoadTodos(
      Stream<LoadTodosAction> action, EpicStore<AppState> store) {
    return Observable.fromFuture(todosRepository.loadTodos())
        .map((result) => TodosLoadedAction(todos: result.map(Todo.fromEntity).toList()))
        .doOnError((error) => TodosNotLoadedAction());
  }
}
