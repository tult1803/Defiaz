import 'package:difiaz_space/presenter/home/scroll_special_home.dart';
import 'package:flutter/material.dart';

class SpecialHome extends StatefulWidget {
  const SpecialHome({Key? key}) : super(key: key);

  @override
  _SpecialHomeState createState() => _SpecialHomeState();
}

class _SpecialHomeState extends State<SpecialHome> {
  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: 76,);
  }
}
