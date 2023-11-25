import './models/crypto_coin_model.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoinModel>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB,USDC,DOGE&tsyms=USD');
    // debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataList = data.entries
        .map((coin) => CryptoCoinModel(
            name: coin.key,
            priceUSD: (coin.value as Map<String, dynamic>)['USD']))
        .toList();

    return dataList;
  }
}
