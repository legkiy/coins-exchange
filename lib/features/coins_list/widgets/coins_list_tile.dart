import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

class CoinsListTile extends StatelessWidget {
  const CoinsListTile({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoCoinModel coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final coinPriceRound = coin.priceUSD.toStringAsFixed(2);

    return ListTile(
      leading: Image.network(
        coin.imageUrl,
        height: 50,
        width: 50,
      ),
      title: Text(
        coin.name,
        style: theme.bodyMedium,
      ),
      subtitle: Text(
        '$coinPriceRound \$',
        style: theme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin.name);
      },
    );
  }
}
