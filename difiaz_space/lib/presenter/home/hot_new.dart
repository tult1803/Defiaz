import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:flutter/material.dart';

class HotNews extends StatefulWidget {
  int categories;

  HotNews({required this.categories});

  @override
  _HotNewsState createState() => _HotNewsState();
}

class _HotNewsState extends State<HotNews> {

  getData() async {
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    if(dataHotNews == null) {
      dataHotNews = await categoriesBlog.getData(
          categories: "${widget.categories}", page: "1", perPage: "4");
    }
    return dataHotNews;
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
                  id: dataHotNews![0].id,
                  imgUrl: dataHotNews![0].yoastHeadJson!.ogImage!.first.url,
                  title: dataHotNews![0].title?.rendered,
                  content: dataHotNews![0].content!.rendered,
                  redirectUrl: dataHotNews![0].guid!.rendered,
                ),
                containerHotNews(
                  context,
                  size: size,
                  id: dataHotNews![1].id,
                  imgUrl: dataHotNews![1].yoastHeadJson!.ogImage!.first.url,
                  title: dataHotNews![1].title?.rendered,
                  content: dataHotNews![1].content!.rendered,
                  redirectUrl: dataHotNews![1].guid!.rendered,
                ),
                containerHotNews(
                  context,
                  size: size,
                  id: dataHotNews![2].id,
                  imgUrl: dataHotNews![2].yoastHeadJson!.ogImage!.first.url,
                  title: dataHotNews![2].title?.rendered,
                  content: dataHotNews![2].content!.rendered,
                  redirectUrl: dataHotNews![2].guid!.rendered,
                ),
                containerHotNews(
                  context,
                  size: size,
                  id: dataHotNews![3].id,
                  imgUrl: dataHotNews![3].yoastHeadJson!.ogImage!.first.url,
                  title: dataHotNews![3].title?.rendered,
                  content: dataHotNews![3].content!.rendered,
                  redirectUrl: dataHotNews![3].guid!.rendered,
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
