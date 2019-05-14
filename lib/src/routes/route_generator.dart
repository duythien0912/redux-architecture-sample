import 'package:flutter/material.dart';
import 'package:redux_architecture_sample/src/view/views.dart';
import 'package:redux_architecture_sample/src/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments; // To pass data if necessary

    switch (settings.name) {
      case ArchRoutes.addTodo:
        return MaterialPageRoute(builder: (_) => TodosPage());
      case ArchRoutes.todosPage:
        return MaterialPageRoute(builder: (_) => TodosPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text("ERROR"),
              ),
            ));
  }
}
