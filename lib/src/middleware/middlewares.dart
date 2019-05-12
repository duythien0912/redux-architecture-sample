import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:todos_repository_core/todos_repository_core.dart';
import 'todos_epic.dart';

List<Middleware<AppState>> createMiddleWares(
    [TodosRepository todosRepository]) {
  final _todosEpic = TodosEpic(todosRepository);

  return [
    LoggingMiddleware.printer(),
    EpicMiddleware(_todosEpic.epics()),
  ];
}
