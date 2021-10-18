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
    _widget = HomePage(index: widget.index,);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColorAppBar,
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            'images/logo_defiaz.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ]),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const NotiAppBar()));
              },
              child: Image.asset(
                'images/noti.png',
                fit: BoxFit.contain,
                height: 20,
                width: 20,
                color: colorImageBottomNavigationBarItem,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  ListAppBar()));
              },
              child: SizedBox(height: 20, width: 20,child: Image(image: AssetImage("images/icon_list.png"), color: colorImageBottomNavigationBarItem,)),
            ),
          ),
        ],
      ),
      body: _widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Image(image: AssetImage("images/home.png"), height: 25,width: 25, color: colorImageBottomNavigationBarItem,),
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Image(image: AssetImage("images/search.png"), height: 25,width: 25, color: colorImageBottomNavigationBarItem,),
            ),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Image(image: AssetImage("images/saved.png"), height: 25,width: 25, color: colorImageBottomNavigationBarItem,),
            ),
            label: 'Thích',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Image(image: AssetImage("images/user.png"), height: 25,width: 25, color: colorImageBottomNavigationBarItem,),
            ),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        selectedItemColor: selectedItemColor,
        onTap: (value) async{
          _selectedIndex = value;
          _widget = await indexWidgetMainPage(index: _selectedIndex);
          setState(() {});
        },
      ),
    );
  }
}
