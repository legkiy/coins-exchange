import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinsListTile extends StatelessWidget {
  const CoinsListTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin-logo.svg',
        height: 30,
        width: 30,
      ),
      title: Text(
        coinName,
        style: theme.bodyMedium,
      ),
      subtitle: Text(
        '20000\$',
        style: theme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coinName);
      },
    );
  }
}
