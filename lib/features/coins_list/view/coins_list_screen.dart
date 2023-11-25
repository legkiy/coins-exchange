import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CoinsListScreen extends StatefulWidget {
  const CoinsListScreen({super.key, required this.title});

  final String title;

  @override
  State<CoinsListScreen> createState() => _CoinsListScreenState();
}

class _CoinsListScreenState extends State<CoinsListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: theme.dividerColor,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          const coinName = 'Bitcoin';

          return const CoinsListTile(coinName: coinName);
        },
      ),
    );
  }
}
