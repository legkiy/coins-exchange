import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CoinsListApp extends StatelessWidget {
  const CoinsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coins List',
      theme: datrkTheme,
      routes: router,
    );
  }
}
