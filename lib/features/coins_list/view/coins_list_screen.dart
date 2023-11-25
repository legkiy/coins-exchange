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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _cryptoCoinsList == null
          ? const SizedBox()
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: theme.dividerColor,
              ),
              itemCount: _cryptoCoinsList!.length,
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];
                final coinName = coin.name;

                return CoinsListTile(coinName: coinName);
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh_outlined),
          onPressed: () async {
            _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
            setState(() {});
          }),
    );
  }
}
