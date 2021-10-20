import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/components/slide.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/main_page.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:flutter/material.dart';


class OutStanding extends StatefulWidget {
  int categories;

  OutStanding({required this.categories});

  @override
  _WrapSliderState createState() => _WrapSliderState();
}

class _WrapSliderState extends State<OutStanding> {

  getData() async {
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    if(dataOutStanding == null) {
      dataOutStanding = await categoriesBlog.getData(
          categories: "${widget.categories}", page: "1", perPage: "4");
    }
    return dataOutStanding;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('Categories ${widget.categories} has data');
          return Column(
            children: [
              slideWeight(
                context: context,
                id: dataOutStanding![0].id,
                imgUrl: dataOutStanding![0].yoastHeadJson!.ogImage!.first.url,
                title: dataOutStanding![0].yoastHeadJson!.title,
                content: dataOutStanding![0].yoastHeadJson!.description,
                contentDetail: dataOutStanding![0].content!.rendered,
                redirectUrl: dataOutStanding![0].guid!.rendered,
              ),
              slideWeight(
                context: context,
                id: dataOutStanding![1].id,
                imgUrl: dataOutStanding![1].yoastHeadJson!.ogImage!.first.url,
                title: dataOutStanding![1].yoastHeadJson!.title,
                content: dataOutStanding![1].yoastHeadJson!.description,
                contentDetail: dataOutStanding![1].content!.rendered,
                redirectUrl: dataOutStanding![1].guid!.rendered,
              ),
              slideWeight(
                context: context,
                id: dataOutStanding![2].id,
                imgUrl: dataOutStanding![2].yoastHeadJson!.ogImage!.first.url,
                title: dataOutStanding![2].yoastHeadJson!.title,
                content: dataOutStanding![2].yoastHeadJson!.description,
                contentDetail: dataOutStanding![2].content!.rendered,
                redirectUrl: dataOutStanding![2].guid!.rendered,
              ),
              containerViewMore(context,
                  widget: MainPage(
                    index: 1,
                  )),
            ],
          );
        }

        return loadingContainer(MediaQuery.of(context).size);
      },
    );
  }
}
