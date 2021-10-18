import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/view/home/mini_page/defi_nfts.dart';
import 'package:difiaz_space/view/home/mini_page/exchange_page.dart';
import 'package:difiaz_space/view/home/mini_page/favorite_home.dart';
import 'package:difiaz_space/view/home/mini_page/home_home.dart';
import 'package:difiaz_space/view/home/mini_page/knowledge_page.dart';
import 'package:difiaz_space/view/home/mini_page/new_home.dart';
import 'package:difiaz_space/view/home/mini_page/special_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  int? index;

  HomePage({this.index});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late int _index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.index == null ? _index = 0 : _index = widget.index!;
    _tabController = TabController(length: 7, vsync: this, initialIndex: _index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(width: size.width, height: 50, child: bottomAppBar()),
        Expanded(child: tabBarView()),
      ],
    );
  }

  Widget bottomAppBar() {
    return TabBar(
      // labelPadding: EdgeInsets.symmetric(horizontal: 7.0),
      indicatorColor: indicatorColor,
      isScrollable: true,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      controller: _tabController,
      tabs: const <Widget>[
        Tab(text: "Trang chủ"),
        Tab(text: "Nổi bật"),
        Tab(text: "Mới nhất"),
        Tab(text: "Xem nhiều"),
        Tab(text: "DEFI & NFTS"),
        Tab(text: "Kiến thức"),
        Tab(text: "Sàn giao dịch"),
      ],
    );
  }

  Widget tabBarView() {
    return Container(
      child: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          HomeHome(),
          SpecialHome(),
          NewHome(),
          FavoriteHome(),
          DefiNFTSPage(),
          KnowledgePage(),
          ExchangePage(),
        ],
      ),
    );
  }
}
