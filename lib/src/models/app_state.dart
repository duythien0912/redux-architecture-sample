import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:redux_architecture_sample/src/res/themes.dart';

@immutable
class AppState extends Equatable {
//  final bool isLoading;
  final ThemeData theme;
  final isEnableDarkTheme;

//  AppState({@required this.isLoading, this.theme});
  AppState({this.theme, this.isEnableDarkTheme})
      : super([theme, isEnableDarkTheme]);

//  factory AppState.loading() =>
//      AppState(isLoading: true, theme: AppTheme.basicTheme);

  factory AppState.initial() =>
      AppState(theme: ThemeData.light(), isEnableDarkTheme: true);

  AppState copyWith({ThemeData theme, bool isEnableDarkTheme}) {
    return AppState(
        theme: theme ?? this.theme,
        isEnableDarkTheme: isEnableDarkTheme ?? this.isEnableDarkTheme);
  }

  @override
  String toString() {
    return 'AppState{theme: $theme, darkTheme: $isEnableDarkTheme}';
  }
}
