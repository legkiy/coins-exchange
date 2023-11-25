import 'package:flutter/material.dart';

final datrkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[700],
        shadowColor: Colors.grey[700],
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 190, 255, 68))),
    scaffoldBackgroundColor: Colors.grey[600],
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        labelSmall: TextStyle(color: Colors.white70, fontSize: 16)),
    dividerColor: Colors.white10,
    listTileTheme: const ListTileThemeData(
      iconColor: Color.fromARGB(255, 190, 255, 68),
    ),
    useMaterial3: true);
