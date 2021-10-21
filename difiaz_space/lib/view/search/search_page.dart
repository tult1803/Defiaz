import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/components/slide.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:difiaz_space/presenter/home/search_detail.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentPos = 0;

  getData() async{
    GetCategoriesBlog categoriesBlog = GetCategoriesBlog();
    if(dataSearchPage == null){dataSearchPage = await categoriesBlog.getData(categories: "74", page: "1", perPage: "5");}
    return dataSearchPage;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          searchField(),
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: dataSearchPage!.length,
                    itemBuilder: (context, index, realIndex) {
                      return slideSearchPage(context: context,
                          id: dataSearchPage![index].id,
                        imgUrl: dataSearchPage![index].yoastHeadJson!.ogImage!.first.url,
                        title: dataSearchPage![index].title!.rendered,
                      redirectUrl: dataSearchPage![index].guid!.rendered,
                      contentDetail: dataSearchPage![index].content!.rendered);
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
                      aspectRatio: 2.35,
                      initialPage: 0,
                    ),
                  ),
                );
              }
              return loadingContainer(MediaQuery.of(context).size);
            },
          ),
          circleSlide(currentPos),
          const SizedBox(height: 10),
          containerTitle("Nổi Bật Cho Bạn", widthSizeBox: 0),
          containerSpecialForYou(
              context: context,
              title: "DEFI & NFTS - Trending",
              content: "Whale"),
          containerSpecialForYou(
              context: context,
              title: "KIẾN THỨC - Trending",
              content: "Blockchain"),
          containerSpecialForYou(
              context: context,
              title: "TIN TỨC - Trending",
              content: "Tiền điện tử"),
          containerSpecialForYou(
              context: context,
              title: "SÀN GIAO DỊCH - Trending",
              content: "Liquidity Pools"),
        ],
      ),
    );
  }

  Widget searchField() {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 0),
      height: 35,
      child: TextField(
        cursorColor: colorHexa("7cc618"),
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: "Tìm kiếm",
          prefixIcon: Icon(
            Icons.search,
            color: colorIconSearch,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorHexa("7cc618"),
              ),
              borderRadius: BorderRadius.circular(17)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        onSubmitted: (value) {
          if(value.isNotEmpty){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchDetail(search: value,)));
          }
        },
      ),
    );
  }

  Widget containerSpecialForYou({context, Widget? widget, title, content}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchDetail(search: content,)));
      },
      child: Container(
        // color: backgroundColorAppBar,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "$title",
                        maxLines: 1,
                        style: TextStyle(
                          color: colorTitleContainerSpecialForYou,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        "$content",
                        maxLines: 1,
                        style: TextStyle(
                            color: colorContentContainerSpecialForYou,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     if (widget != null) {
                //       Navigator.of(context)
                //           .push(MaterialPageRoute(builder: (context) => widget));
                //     }
                //   },
                //   child: SizedBox(
                //     width: 20,
                //     height: 60,
                //     child: Image(image: const AssetImage("images/icon_dot.png"),color: colorImageContainerSpecialForYou),
                //     // child: ,
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 1.5,
              child: Container(
                color: Colors.black26,
              ),
            )
          ],
        ),
      ),
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
                color: index == 0
                    ?  colorHexa("636363")
                    : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 1
                    ?  colorHexa("636363")
                    : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 2
                    ?  colorHexa("636363")
                    : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 3
                    ?  colorHexa("636363")
                    : colorHexa("d9d9d9"))),
        Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 4
                    ?  colorHexa("636363")
                    : colorHexa("d9d9d9"))),
      ],
    );
  }
}
