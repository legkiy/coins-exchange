import 'package:flutter/material.dart';

const primoryColor = Color.fromARGB(255, 190, 255, 68);
final datrkTheme = ThemeData(
  appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.grey[700],
      shadowColor: Colors.grey[700],
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      iconTheme: const IconThemeData(color: primoryColor)),
  scaffoldBackgroundColor: Colors.grey[600],
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      labelSmall: TextStyle(color: Colors.white70, fontSize: 16)),
  dividerColor: Colors.white10,
  listTileTheme: const ListTileThemeData(
    iconColor: primoryColor,
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: primoryColor),
  useMaterial3: true,
);
