import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/components/slide.dart';
import 'package:difiaz_space/data_demo.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:difiaz_space/model/model_data_categories_blog.dart';
import 'package:flutter/material.dart';

class SpecialNews extends StatefulWidget {
  int categories;

  SpecialNews({required this.categories});

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}


class _CarouselSliderState extends State<SpecialNews> {
  int currentPos = 0;

  getData() async {
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    if (dataSpecialNews == null) {
      dataSpecialNews = await categoriesBlog.getData(
          categories: "${widget.categories}", page: "1", perPage: "5");
    }
    return dataSpecialNews;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CarouselSlider.builder(
                itemCount: dataSpecialNews!.length,
                itemBuilder: (context, index, realIndex) {
                  return slideHeight(
                      context: context,
                      id: dataSpecialNews![index].id,
                      imgUrl: dataSpecialNews![index]
                          .yoastHeadJson!
                          .ogImage!
                          .first
                          .url,
                      title: dataSpecialNews![index].title!.rendered,
                      contentDetail: dataSpecialNews![index].content!.rendered,
                      redirectUrl: dataSpecialNews![index].guid!.rendered,
                      author: authorDemo,
                      time: timeDemo,
                      type: typeDemo,
                      views: viewsDemo);
                },
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  },
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  viewportFraction: 0.7,
                  aspectRatio: 1.3,
                  initialPage: 0,
                ),
              );
            }
            return loadingContainer(MediaQuery.of(context).size);
          },
        ),
        circleSlide(currentPos),
      ],
    );
  }

  Widget circleSlide(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 0 ? colorHexa("636363") : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 1 ? colorHexa("636363") : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 2 ? colorHexa("636363") : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 3 ? colorHexa("636363") : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 4 ? colorHexa("636363") : colorHexa("d9d9d9"))),
      ],
    );
  }
}
