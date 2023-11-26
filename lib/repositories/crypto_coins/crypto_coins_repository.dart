import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CryptoCoinModel>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.ssscryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,USDC,DOGE&tsyms=USD');
    // debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRow = data['RAW'] as Map<String, dynamic>;

    final dataList = dataRow.entries.map((coin) {
      final usdData =
          (coin.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;

      return CryptoCoinModel(
        name: coin.key,
        priceUSD: usdData['PRICE'],
        imageUrl: 'https://www.cryptocompare.com${usdData['IMAGEURL']}',
      );
    }).toList();

    return dataList;
  }
}
