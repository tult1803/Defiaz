import 'package:difiaz_space/presenter/home/scroll_special_home.dart';
import 'package:flutter/material.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: 73,);
  }
}
