import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewChart extends StatefulWidget {
  const WebViewChart({Key? key}) : super(key: key);

  @override
  _WebViewChartState createState() => _WebViewChartState();
}

class _WebViewChartState extends State<WebViewChart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WebView(
      initialUrl: Uri.dataFromString(
              '<body><iframe src="https://s.tradingview.com/mediumwidgetembed/?symbols=BTC,ETH,XRP,BCH,LTC&BTC=HITBTC%3ABTCUSDT%7C12m&ETH=HITBTC%3AETHUSDT%7C12m&XRP=HITBTC%3AXRPUSDT%7C12m&BCH=HITBTC%3ABCHUSDT%7C12m&LTC=HITBTC%3ALTCUSDT%7C12m&locale=en&trendLineColor=%234bafe9&underLineColor=%23dbeffb&fontColor=%2383888D&gridLineColor=%23e9e9ea&width=100%25&height=420px&colorTheme=undefined&utm_source=cointelegraph.com&utm_medium=widget&utm_campaign=symbol-overview", width="${size.width * 2.5}px", height="700px"></iframe></body>',
              mimeType: 'text/html')
          .toString(),
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
