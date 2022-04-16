import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  fontFamily: 'Twitterchirp',
  primarySwatch: Colors.blue,
);

ThemeData themeData() {
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      // TODO: Replace transparent color by theme color

      primary: Colors.transparent,
      primaryContainer: Colors.transparent,
      secondary: Colors.transparent,
      secondaryContainer: Colors.transparent,
      background: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: Colors.transparent,
    textTheme: const TextTheme(
        bodyText1: TextStyle(
      color: Colors.transparent,
    )),
  );
}
