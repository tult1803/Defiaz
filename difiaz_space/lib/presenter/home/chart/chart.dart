import 'package:difiaz_space/presenter/home/chart/price_coins.dart';
import 'package:difiaz_space/presenter/home/chart/web_view.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: size.width,
      height: 800,
      child: Column(
        children: [
          const Expanded(
            child: WebViewChart(),
          ),
          Container(
            color: Colors.grey,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  width: 100,
                  child: Center(
                      child: Text(
                    "NAME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  width: 100,
                  child: Center(
                      child: Text(
                    "PRICE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 500,
            child: const PriceCoins(),
          ),
        ],
      ),
    );
  }
}
