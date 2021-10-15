import 'package:difiaz_space/helpers/url.dart';
import 'package:http/http.dart' as http;
import '../model_data_coins.dart';

class GetCoins {
  getCoin({required vsCurrency, required order, required perPage}) async {
    try {
      var response = await http.get(
          Uri.https(urlMain, urlGetCoin, {
            "vs_currency": "$vsCurrency",
            "order": "$order",
            "per_page": "$perPage",
            "page": "1",
            "sparkline": "false"
          }),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          });

      print('Get API Get Coins: ${response.statusCode}');
      if (response.statusCode == 200) {
        return coinsFromJson(response.body);
      } else {
        return [];
      }
    }catch(e){
      print(e);
    }
  }
}

