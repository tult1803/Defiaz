import 'package:difiaz_space/presenter/home/scroll_special_home.dart';
import 'package:flutter/material.dart';

class FavoriteHome extends StatefulWidget {
  const FavoriteHome({Key? key}) : super(key: key);

  @override
  _FavoriteHomeState createState() => _FavoriteHomeState();
}

class _FavoriteHomeState extends State<FavoriteHome> {
  @override
  Widget build(BuildContext context) {
    return scrollSpecialHome(categories: 74,);
  }
}
