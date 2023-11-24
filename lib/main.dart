import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coins List',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[700],
              shadowColor: Colors.grey[700],
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 190, 255, 68))),
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
          useMaterial3: true),
      routes: {
        '/': (context) => const CoinsListScreen(title: 'Coins List'),
        '/coin': (context) => const CoinScreen()
      },
    );
  }
}

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
        // backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: theme.dividerColor,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin-logo.svg',
            height: 30,
            width: 30,
          ),
          title: Text(
            'coin',
            style: theme.textTheme.bodyMedium,
          ),
          subtitle: Text(
            '20000\$',
            style: theme.textTheme.labelSmall,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.of(context).pushNamed('/coin');
          },
        ),
      ),
    );
  }
}

class CoinScreen extends StatelessWidget {
  const CoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin'),
      ),
    );
  }
}
