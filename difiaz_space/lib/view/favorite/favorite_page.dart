import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/components/load/loading_animation.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/helpers/validate_data.dart';
import 'package:difiaz_space/model/get/get_posts_count_view.dart';
import 'package:difiaz_space/model/model_data_categories_blog.dart';
import 'package:flutter/material.dart';

import '../../data_demo.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  getData() async{
    GetCCountViewBlog viewBlog = GetCCountViewBlog();
    if(dataFavorite == null) {
      dataFavorite = await viewBlog.getData();
    }
    return dataFavorite;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getData(),
        builder: (context, snapshot) {
        if(snapshot.hasData) {
            return ListView.builder(
              itemCount: dataFavorite!.length,
              itemBuilder: (context, index) {
                if(index <= 4){
                  dataFavorite!.sort(sortPostViews);
                  // dataFavorite!.sort((a, b) => a.countViews!.compareTo(b.countViews!));
                  return containerFavorite(context,
                    size: size,
                    id: dataFavorite![index].id,
                    redirectUrl: dataFavorite![index].guid!.rendered,
                    imgUrl: dataFavorite![index].yoastHeadJson!.ogImage!.first.url,
                    title: dataFavorite![index].title!.rendered,
                    author: "Views: ${dataFavorite![index].countViews}",
                    content: dataFavorite![index].content!.rendered,);
                }
                return const SizedBox();

              },);
          }else {
            Center(child: firstPageErrorIndicatorBuilder(context, tittle: "Lỗi tải dữ liệu"),);
        }
        return Center(
            child: ColorLoader(radius: 20, dotRadius: 6,),
          );
        },);
  }
}
