import '../features/coin/coin.dart';
import '../features/coins_list/coins_list.dart';

final router = {
  '/': (context) => const CoinsListScreen(title: 'Coins List'),
  '/coin': (context) => const CoinScreen()
};
