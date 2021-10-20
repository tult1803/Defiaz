import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/components/slide.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/main_page.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:difiaz_space/model/model_data_categories_blog.dart';
import 'package:flutter/material.dart';

class NewestVsViews extends StatefulWidget {
  int categories;

  NewestVsViews({required this.categories});

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<NewestVsViews> {
  List<CategoriesBlog>? dataNewestVsViews;
  getData() async {
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    if(widget.categories == 70) {
      if (dataNewestVsViews70 == null) {
        dataNewestVsViews70 = await categoriesBlog.getData(
            categories: "${widget.categories}", page: "1", perPage: "8");
      }
      dataNewestVsViews = dataNewestVsViews70;
      setState(() {});
    }else {
      if (dataNewestVsViews73 == null) {
        dataNewestVsViews73 = await categoriesBlog.getData(
            categories: "${widget.categories}", page: "1", perPage: "8");
      }
      dataNewestVsViews = dataNewestVsViews73;
      setState(() {});
    }
    return dataNewestVsViews;
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
              CarouselSlider.builder(
                itemCount: 4,
                itemBuilder: (context, index, realIndex) {
                  return slideWeight(
                      context: context,
                      id: dataNewestVsViews![index].id,
                      contentDetail: dataNewestVsViews![index].content!.rendered,
                      imgUrl: dataNewestVsViews![index].yoastHeadJson!.ogImage!.first.url,
                      title: dataNewestVsViews![index].yoastHeadJson!.title,
                      redirectUrl: dataNewestVsViews![index].guid!.rendered,
                      content: dataNewestVsViews![index].yoastHeadJson!.description);
                },
                options: CarouselOptions(
                  autoPlay: false,
                  // autoPlayAnimationDuration: const Duration(seconds: 3),
                  viewportFraction: 1,
                  aspectRatio: 1.8,
                  initialPage: 1,
                ),
              ),
              CarouselSlider.builder(
                itemCount: 4,
                itemBuilder: (context, index, realIndex) {
                  return slideWeight(
                      context: context,
                      id: dataNewestVsViews![index + 4].id,
                      contentDetail: dataNewestVsViews![index + 4].content!.rendered,
                      imgUrl: dataNewestVsViews![index + 4].yoastHeadJson!.ogImage!.first.url,
                      title: dataNewestVsViews![index + 4].yoastHeadJson!.title,
                      redirectUrl: dataNewestVsViews![index + 4].guid!.rendered,
                      content: dataNewestVsViews![index + 4].yoastHeadJson!.description);
                },
                options: CarouselOptions(
                  autoPlay: false,
                  // autoPlayAnimationDuration: const Duration(seconds: 3),
                  viewportFraction: 1,
                  aspectRatio: 1.8,
                  initialPage: 0,
                ),
              ),
              containerViewMore(context, widget: widget.categories == 74 ? MainPage(index: 2):MainPage(index: 3)),
            ],
          );
        }

        return loadingContainer(MediaQuery.of(context).size);
      },
    );
  }
}
