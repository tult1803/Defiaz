import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/presenter/home/chart/chart.dart';
import 'package:difiaz_space/presenter/home/hot_new.dart';
import 'package:difiaz_space/presenter/home/special.dart';
import 'package:difiaz_space/presenter/home/newest_vs_views.dart';
import 'package:difiaz_space/presenter/home/out_standing.dart';
import 'package:flutter/material.dart';

class HomeHome extends StatefulWidget {
  const HomeHome({Key? key}) : super(key: key);

  @override
  _HomeHomeState createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SpecialNews(categories: 74,),
            const SizedBox(height: 32,),
            containerTitle("NỔI BẬT"),
            OutStanding(categories: 76,),
            containerTitle("SÀN GIAO DỊCH", widthSizeBox: 180),
            NewestVsViews(categories: 70,),
            containerTitle("XEM NHIỀU"),
            NewestVsViews(categories: 73,),
            containerTitle("TIN HOT TRONG TUẦN", widthSizeBox: 250),
            HotNews(categories: 69,),
            containerTitle("CHART", widthSizeBox: 0),
            const Chart(),
          ],
        ),
      ),
    );
  }
}
