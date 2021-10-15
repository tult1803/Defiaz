import 'package:difiaz_space/presenter/home/scroll_special_home.dart';
import 'package:flutter/material.dart';

class DefiNFTSPage extends StatefulWidget {
  const DefiNFTSPage({Key? key}) : super(key: key);

  @override
  _DefiNFTSPageState createState() => _DefiNFTSPageState();
}

class _DefiNFTSPageState extends State<DefiNFTSPage> {
  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: 73,);
  }
}
