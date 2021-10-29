import 'dart:ui';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:difiaz_space/helpers/validate_data.dart';
import 'package:difiaz_space/presenter/home/show_detail_blog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

//Chữ trong container
Widget containerText(title,
    {required int maxLines,
    required double fontSize,
    required double heightContainer}) {
  return Container(
    height: heightContainer,
    child: AutoSizeText(
      "$title",
      style: GoogleFonts.manrope(
          color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
      maxFontSize: fontSize,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    ),
  );
}

// Dùng cho title của các container trong trang chủ
Widget containerTitle(title, {double? widthSizeBox}) {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
              color: colorContainerTitle,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 1.5,
          width: widthSizeBox ?? 120,
          child: Container(
            color: colorSizeBoxTitle,
          ),
        )
      ],
    ),
  );
}

// Dùng cho nút Xem Thêm trong trang chủ
Widget containerViewMore(BuildContext context, {Widget? widget}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, bottom: 20),
    width: 150,
    height: 40,
    decoration: BoxDecoration(
      color: colorContainerViewMore,
      borderRadius: BorderRadius.circular(100),
    ),
    child: TextButton(
        onPressed: () {
          if (widget != null) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => widget),
                (route) => false);
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0))),
        ),
        child: Text(
          "Xem thêm",
          style: GoogleFonts.manrope(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        )),
  );
}

//Dùng cho tin hot trong tuần của trang chủ
Widget containerHotNews(
  context, {
  size,
  id,
  imgUrl,
  title,
  content,
  redirectUrl,
}) {
  return GestureDetector(
    onTap: () {
      String htmlData = "<body>$content</body>";
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
    child: Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: size.width,
      height: 70,
      child: Row(
        children: [
          Image.network(
            imgUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: AutoSizeText(
              "$title",
              maxLines: 2,
              style: TextStyle(
                  color: colorContainerHotNews, fontWeight: FontWeight.w500),
            ),
          )),
        ],
      ),
    ),
  );
}

//Dùng cho bài viết đã lưu
Widget containerFavorite(context,
    {size, imgUrl, title, author, content, redirectUrl, id}) {
  return GestureDetector(
    onTap: () {
      if (content != null) {
        String htmlData = "<body>$content</body>";
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailBlog(
              id: id,
              htmlData: htmlData,
              title: "$title",
              mainUrl: imgUrl,
              redirectUrl: redirectUrl),
        ));
      }
    },
    child: Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: size.width,
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              imgUrl,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "$title",
                  maxLines: 2,
                  style: TextStyle(
                      color: colorContainerFavorite,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye_outlined),
                    const SizedBox(width: 5,),
                    AutoSizeText(
                      "$author",
                      maxLines: 1,
                      style: TextStyle(
                          color: colorSizeBoxFavorite, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    ),
  );
}

Widget containerPriceCoins({size, urlImg, nameCoin, currentPrice}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    width: size.width,
    height: 40,
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.black54,
          width: 0.5,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                "$urlImg",
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "$nameCoin",
                style: TextStyle(
                    color: colorContainerPriceCoins,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: 120,
            child: Center(
              child: Text(
                "\$${getFormatPrice(currentPrice)}",
                style: TextStyle(color: colorContainerPriceCoins),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//Dùng thể hiện container ở trạng thái đang loading
Widget loadingContainer(size) {
  return Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: colorHexa("C4C4C4"),
    highlightColor: colorHexa("FFFFFF"),
    enabled: true,
    child: const Padding(
      padding: EdgeInsets.all(10.0),
      child: Image(image: AssetImage("images/loading_defiaz.png")),
    ),
  );
}

//Dùng thể hiện container ở trạng thái đang loading Tin Hot Trong Tuần
Widget loadingContainerHotNews(size) {
  return Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: colorHexa("C4C4C4"),
    highlightColor: colorHexa("FFFFFF"),
    enabled: true,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        width: size.width,
        height: 70,
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              color: Colors.white24,
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 20),
              color: Colors.white24,
            )),
          ],
        ),
      ),
    ),
  );
}
