import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/model/get/get_data_coin.dart';
import 'package:difiaz_space/model/model_data_coins.dart';
import 'package:flutter/material.dart';

class PriceCoins extends StatefulWidget {
  const PriceCoins({Key? key}) : super(key: key);

  @override
  _PriceCoinsState createState() => _PriceCoinsState();
}

class _PriceCoinsState extends State<PriceCoins> {
  List<Coins>? data;

  getCoin() async {
    GetCoins getCoins = GetCoins();
    data = await getCoins.getCoin(
        vsCurrency: "usd", order: "market_cap_desc", perPage: "10");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getCoin(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: size.width,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return containerPriceCoins(
                            size: size,
                            urlImg: "${data![index].image}",
                            currentPrice: "${data![index].currentPrice}",
                            nameCoin: "${data![index].name}");
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
