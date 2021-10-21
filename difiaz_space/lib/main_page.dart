import 'package:difiaz_space/components/icon/defiaaz_icon_icons.dart';
import 'package:difiaz_space/helpers/validate_data.dart';
import 'package:difiaz_space/view/home/home_page.dart';
import 'package:difiaz_space/view/list_app_bar.dart';
import 'package:difiaz_space/view/notification_page.dart';
import 'package:flutter/material.dart';

import 'helpers/color.dart';

class MainPage extends StatefulWidget {
  int? index;

  MainPage({this.index});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;
  late Widget _widget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = 0;
    _widget = HomePage(
      index: widget.index,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            'images/logo_defiaz.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotiAppBar()));
              },
              child: const Icon(DefiaazIcon.noti, size: 20,),
              // child: Image.asset(
              //   'images/noti.png',
              //   fit: BoxFit.contain,
              //   height: 20,
              //   width: 20,
              //   color: colorImageBottomNavigationBarItem,
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListAppBar()));
              },
              child: const Icon(Icons.list, size: 25),
            ),
          ),
        ],
      ),
      body: _widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(DefiaazIcon.home, size: 25,),
              ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(DefiaazIcon.search, size: 25,),
            ),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.favorite_border_rounded, size: 25,),
            ),
            label: 'Thích',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(DefiaazIcon.profile, size: 25,),
            ),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        onTap: (value) async {
          _selectedIndex = value;
          _widget = await indexWidgetMainPage(index: _selectedIndex);
          setState(() {});
        },
      ),
    );
  }
}
