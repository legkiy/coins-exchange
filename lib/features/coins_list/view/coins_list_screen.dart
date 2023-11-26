import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CoinsListScreen extends StatefulWidget {
  const CoinsListScreen({super.key, required this.title});

  final String title;

  @override
  State<CoinsListScreen> createState() => _CoinsListScreenState();
}

class _CoinsListScreenState extends State<CoinsListScreen> {
  List<CryptoCoinModel>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCoinsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: _cryptoCoinsList == null
          ? Center(
              child: CircularProgressIndicator(
                  color: theme.floatingActionButtonTheme.backgroundColor),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: theme.dividerColor,
              ),
              padding: const EdgeInsets.only(top: 10),
              itemCount: _cryptoCoinsList!.length,
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];

                return CoinsListTile(
                  coin: coin,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh_outlined),
          onPressed: () async {
            await _loadCoinsList();
          }),
    );
  }

  Future<void> _loadCoinsList() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}
