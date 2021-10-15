import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:difiaz_space/model/model_data_categories_blog.dart';
import 'package:flutter/material.dart';

class HotNews extends StatefulWidget {
  int categories;

  HotNews({required this.categories});

  @override
  _HotNewsState createState() => _HotNewsState();
}

class _HotNewsState extends State<HotNews> {
  List<CategoriesBlog>? data;

  getData() async {
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    data = await categoriesBlog.getData(
        categories: "${widget.categories}", page: "1", perPage: "4");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          print('Categories ${widget.categories} has data');
          return Container(
            margin: const EdgeInsets.only(top: 10, bottom: 30),
            child: Column(
              children: [
                containerHotNews(
                  context,
                  size: size,
                  imgUrl: data![0].yoastHeadJson!.ogImage!.first.url,
                  title: data![0].title?.rendered,
                  content: data![0].content!.rendered,
                  redirectUrl: data![0].guid!.rendered,
                ),
                containerHotNews(
                  context,
                  size: size,
                  imgUrl: data![1].yoastHeadJson!.ogImage!.first.url,
                  title: data![1].title?.rendered,
                  content: data![1].content!.rendered,
                  redirectUrl: data![1].guid!.rendered,
                ),
                containerHotNews(
                  context,
                  size: size,
                  imgUrl: data![2].yoastHeadJson!.ogImage!.first.url,
                  title: data![2].title?.rendered,
                  content: data![2].content!.rendered,
                  redirectUrl: data![2].guid!.rendered,
                ),
                containerHotNews(
                  context,
                  size: size,
                  imgUrl: data![3].yoastHeadJson!.ogImage!.first.url,
                  title: data![3].title?.rendered,
                  content: data![3].content!.rendered,
                  redirectUrl: data![3].guid!.rendered,
                ),
              ],
            ),
          );
        }
        return loadingContainerHotNews(size);
      },
    );
  }
}
