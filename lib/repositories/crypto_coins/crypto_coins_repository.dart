import './models/crypto_coin_model.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoinModel>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDC,DOGE&tsyms=USD');
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
