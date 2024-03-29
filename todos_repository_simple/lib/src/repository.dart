// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:todos_repository_core/todos_repository_core.dart';
import 'file_storage.dart';
import 'web_client.dart';

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class TodosRepositoryFlutter implements TodosRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const TodosRepositoryFlutter({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  ///Create fake list data [TodoEntity] to test [Epic Middleware]

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  @override
  Future<List<TodoEntity>> loadTodos() async {
    try {
//      return await fileStorage.loadTodos();
      await Future.delayed(Duration(seconds: 2));
      return [
        TodoEntity(
            "Buy food for da kitty", "1", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "2", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "3", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "3", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "4", "With the chickeny bits!", false),
      ];
    } catch (e) {
//      final todos = await webClient.fetchTodos();

//      fileStorage.saveTodos(todos);
//      return todos;
      await Future.delayed(Duration(seconds: 2));
      return [
        TodoEntity(
            "Buy food for da kitty", "1", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "2", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "3", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "3", "With the chickeny bits!", false),
        TodoEntity(
            "Buy food for da kitty", "4", "With the chickeny bits!", false),
      ];
    }
  }

  // Persists todos to local disk and the web
  @override
  Future saveTodos(List<TodoEntity> todos) {
    return Future.wait<dynamic>([
      fileStorage.saveTodos(todos),
      webClient.postTodos(todos),
    ]);
  }
}
