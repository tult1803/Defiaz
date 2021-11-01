import 'package:difiaz_space/components/icon/defiaaz_icon_icons.dart';
import 'package:difiaz_space/components/icon/icon_noti.dart';
import 'package:difiaz_space/helpers/validate_data.dart';
import 'package:difiaz_space/view/list_app_bar.dart';
import 'package:difiaz_space/view/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
int indexNoti = 0;
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
    _selectedIndex = indexNoti;
    _widget = indexWidgetMainPage(index: _selectedIndex, indexHome: widget.index);
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
            child: NamedIcon(
              isCheck: isNewNoti,
              iconData: DefiaazIcon.noti,
              onTap: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                isNewNoti = false;
                prefs.setBool("isNewNoti", false);
                setState(() {});
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotiAppBar()));
              },
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
              child: Icon(
                DefiaazIcon.home,
                size: 25,
              ),
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                DefiaazIcon.search,
                size: 25,
              ),
            ),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 25,
              ),
            ),
            label: 'Thích',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                DefiaazIcon.profile,
                size: 25,
              ),
            ),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        onTap: (value) async {
          _selectedIndex = value;
          indexNoti = value;
          _widget = await indexWidgetMainPage(index: _selectedIndex);
          setState(() {});
        },
      ),
    );
  }
}
