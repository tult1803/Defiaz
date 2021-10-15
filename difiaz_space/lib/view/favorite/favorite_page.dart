import 'package:difiaz_space/components/container.dart';
import 'package:flutter/material.dart';

import '../../data_demo.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
     return ListView(
       children: [
         containerFavorite(context,
         size: size,
         imgUrl: urlDemo5,
         title: titleDemo,
         author: authorDemo,
         content: null,),
         containerFavorite(context,
           size: size,
           imgUrl: urlDemo1,
           title: titleDemo,
           author: authorDemo,
           content: null,),
         containerFavorite(context,
           size: size,
           imgUrl: urlDemo2,
           title: titleDemo,
           author: authorDemo,
           content: null,),
         containerFavorite(context,
           size: size,
           imgUrl: urlDemo3,
           title: titleDemo,
           author: authorDemo,
           content: null,),
         containerFavorite(context,
           size: size,
           imgUrl: urlDemo4,
           title: titleDemo,
           author: authorDemo,
           content: null,),
       ],
     );
  }
}
