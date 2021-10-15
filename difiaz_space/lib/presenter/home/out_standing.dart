import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/components/slide.dart';
import 'package:difiaz_space/main_page.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:difiaz_space/model/model_data_categories_blog.dart';
import 'package:flutter/material.dart';

import '../../data_demo.dart';

class OutStanding extends StatefulWidget {
  int categories;


  OutStanding({required this.categories});

  @override
  _WrapSliderState createState() => _WrapSliderState();
}

class _WrapSliderState extends State<OutStanding> {
  List<CategoriesBlog>? data;

  getData() async{
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    data = await categoriesBlog.getData(categories: "${widget.categories}", page: "1", perPage: "4");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          print('Categories ${widget.categories} has data');
          return Column(
            children: [
              slideWeight(
                  context: context,
                  imgUrl: data![0].yoastHeadJson!.ogImage!.first.url,
                  title: data![0].yoastHeadJson!.title,
                  content: data![0].yoastHeadJson!.description,
                contentDetail: data![0].content!.rendered,
                redirectUrl: data![0].guid!.rendered,
              ),
              slideWeight(
                  context: context,
                  imgUrl: data![1].yoastHeadJson!.ogImage!.first.url,
                  title: data![1].yoastHeadJson!.title,
                  content: data![1].yoastHeadJson!.description,
                contentDetail: data![1].content!.rendered,
                redirectUrl: data![1].guid!.rendered,),
              slideWeight(
                  context: context,
                  imgUrl: data![2].yoastHeadJson!.ogImage!.first.url,
                  title: data![2].yoastHeadJson!.title,
                  content: data![2].yoastHeadJson!.description,
                contentDetail: data![2].content!.rendered,
                redirectUrl: data![2].guid!.rendered,),
              containerViewMore(context, widget: MainPage(index: 1,)),
            ],
          );
        }

        return loadingContainer(MediaQuery.of(context).size);
      },
    );
  }
}
