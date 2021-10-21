import 'dart:ui';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/presenter/home/show_detail_blog.dart';
import 'package:flutter/material.dart';

//Slider thiên về chiều cao
Widget slideHeight({context ,id,imgUrl, title, author, time, type, views, contentDetail, redirectUrl}) {
  return GestureDetector(
    onTap: () {
     if(contentDetail != null){
       String htmlData = "<body>$contentDetail</body>";
       Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => DetailBlog(
           id: id,
           htmlData: htmlData,
           title: "$title",
           mainUrl: imgUrl,
           redirectUrl: redirectUrl,
         ),
       ));
     }
    },
    child: Stack(
      children: [
        Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 160,
              width: 250,
              decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    containerText(title,
                        heightContainer: 90, fontSize: 17, maxLines: 4),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          containerText(type,
                              heightContainer: 30,
                              maxLines: 1,
                              fontSize: 18),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: AutoSizeText(
                                      "$author",
                                      style: const TextStyle(
                                          color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const Text(
                                    "|",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: AutoSizeText(
                                      "$views",
                                      style: const TextStyle(
                                          color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const Text(
                                    "|",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: AutoSizeText(
                                      "$time",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ],
    ),
  );
}

//Slider thiên về chiều dài

Widget slideWeight(
    {required BuildContext context, id, imgUrl, title, content, contentDetail, redirectUrl}) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      String htmlData = "<body>$contentDetail</body>";
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailBlog(
          id: id,
          htmlData: htmlData,
          title: "$title",
          mainUrl: imgUrl,
          redirectUrl: redirectUrl,
        ),
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 210,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                // height: 100,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      containerText("${title ?? ""}",
                          heightContainer: 55, fontSize: 17, maxLines: 2),
                      AutoSizeText(
                        "${content ?? ""}",
                        style: const TextStyle(color: Colors.white70),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}

Widget slideSearchPage(
    {required BuildContext context, imgUrl, id, title, contentDetail, redirectUrl}) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      String htmlData = "<body>$contentDetail</body>";
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailBlog(
          id: id,
          redirectUrl: redirectUrl,
          htmlData: htmlData,
          title: "$title",
          mainUrl: imgUrl,
        ),
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 145,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                // height: 100,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: containerText("$title",
                      heightContainer: 65, fontSize: 17, maxLines: 2),
                ),
              )),
        ],
      ),
    ),
  );
}
