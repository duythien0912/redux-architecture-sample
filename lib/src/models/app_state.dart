import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

@immutable
class AppState extends Equatable {
  final bool isLoading;
  final ThemeData theme;
  final isEnableDarkTheme;
  final List<Todo> todos;
  final AppTab activeTab;

  AppState({
      this.isLoading,
      this.theme,
      this.isEnableDarkTheme,
      this.activeTab = AppTab.todos,
      this.todos = const []
  }): super([isLoading, activeTab, theme, isEnableDarkTheme, todos]);

  factory AppState.loading() =>
      AppState(isLoading: true, theme: ThemeData.light(), isEnableDarkTheme: true);

  AppState copyWith({
      bool isLoading,
      List<Todo> todos,
      AppTab activeTab,
      ThemeData theme,
      bool isEnableDarkTheme
  }) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        todos: todos?? this.todos,
        activeTab: activeTab ?? this.activeTab,
        theme: theme ?? this.theme,
        isEnableDarkTheme: isEnableDarkTheme ?? this.isEnableDarkTheme);
  }

  @override
  String toString() {
    return 'AppState{theme: $theme, darkTheme: $isEnableDarkTheme}';
  }
}
