import 'dart:convert';

import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/components/slide.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:difiaz_space/model/get/get_categories_blog.dart';
import 'package:difiaz_space/model/model_data_categories_blog.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// ignore: camel_case_types, must_be_immutable
class scrollSpecialHome extends StatefulWidget {
  int? categories;
  final Widget? widgetToNavigator;

  scrollSpecialHome({Key? key, this.categories, this.widgetToNavigator})
      : super(key: key);

  @override
  scrollSpecialHomeState createState() => scrollSpecialHomeState();
}

// ignore: camel_case_types
class scrollSpecialHomeState extends State<scrollSpecialHome> {
  int _pageSize = 1;
  final PagingController _pagingController = PagingController(firstPageKey: 10);
  late List<CategoriesBlog> data;

  Future<void> _fetchPage(pageKey) async {
    try {
      GetCategoriesBlog getCategoriesBlog = GetCategoriesBlog();
      data = await getCategoriesBlog.getData(
          categories: widget.categories, page: _pageSize, perPage: pageKey);
      final isLastPage = data.length < pageKey;
      if (isLastPage) {
        _pagingController.appendLastPage(data);
      } else {
        setState(() {
          _pageSize += 1;
        });
        final nextPageKey = pageKey;
        _pagingController.appendPage(data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
      height: size.height,
      width: size.width,
      child: CustomScrollView(
        slivers: <Widget>[
          PagedSliverList(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                noMoreItemsIndicatorBuilder: (context) =>
                    firstPageErrorIndicatorBuilder(context,
                        tittle: "Không có dữ liệu"),
                noItemsFoundIndicatorBuilder: (context) =>
                    firstPageErrorIndicatorBuilder(context,
                        tittle: "Không có dữ liệu"),
                newPageErrorIndicatorBuilder: (context) =>
                    firstPageErrorIndicatorBuilder(context,
                        tittle: "Không có dữ liệu"),
                firstPageProgressIndicatorBuilder: (context) =>
                    firstPageProgressIndicatorBuilder(),
                newPageProgressIndicatorBuilder: (context) =>
                    newPageProgressIndicatorBuilder(),
                firstPageErrorIndicatorBuilder: (context) {
                  return Column(
                    children: [
                      firstPageErrorIndicatorBuilder(context,
                          tittle: "Không có dữ liệu"),
                      GestureDetector(
                        onTap: () => _pagingController.refresh(),
                        child: Text(
                          "Nhấn để tải lại",
                          style: TextStyle(
                              color: colorHexa("aff022"), fontSize: 18),
                        ),
                      ),
                    ],
                  );
                },
                itemBuilder: (context, item, index) {
                  String itemEncode = jsonEncode(item);
                  var itemDecode = itemBlogFromJson(itemEncode);
                  return slideWeight(
                    context: context,
                    contentDetail: itemDecode.content!.rendered,
                    imgUrl: itemDecode.yoastHeadJson!.ogImage!.first.url,
                    title: itemDecode.yoastHeadJson!.title,
                    content: itemDecode.yoastHeadJson!.description,
                    redirectUrl: itemDecode.guid!.rendered,
                  );
                },
              )),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
