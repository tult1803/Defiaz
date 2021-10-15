import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/components/container.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main_page.dart';

class ListAppBar extends StatefulWidget {
  const ListAppBar({Key? key}) : super(key: key);

  @override
  _ListAppBarState createState() => _ListAppBarState();
}

class _ListAppBarState extends State<ListAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingAppbar(context, colorIcon: colorHexa("141414")),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Danh mục",
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: colorHexa("141414")),
        ),
      ),
      body: Column(
        children: [
          containerTitle("", widthSizeBox: 0),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  containerPopualarMedia(
                      title: "Nổi bật",
                      widget: MainPage(
                        index: 1,
                      ),
                      img: "images/media01.png"),
                  containerPopualarMedia(
                      title: "Mới nhất",
                      widget: MainPage(
                        index: 2,
                      ),
                      img: "images/media02.png"),
                  containerPopualarMedia(
                      title: "Xem nhiều",
                      widget: MainPage(
                        index: 3,
                      ),
                      img: "images/media03.png"),
                  containerPopualarMedia(
                      title: "DEFI & NFTS",
                      widget: MainPage(
                        index: 4,
                      ),
                      img: "images/media04.png"),
                  containerPopualarMedia(
                      title: "Kiến thức",
                      widget: MainPage(
                        index: 5,
                      ),
                      img: "images/media06.png"),
                  containerPopualarMedia(
                      title: "SÀN GIAO DỊCH & ĐẦU TƯ",
                      widget: MainPage(
                        index: 6,
                      ),
                      img: "images/media05.png"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget containerPopualarMedia({title, img, Widget? widget}) {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          // border: Border.all(color: Colors.black12)
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white38,
            child: img == null ? Container() : Image(image: AssetImage(img)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AutoSizeText(
              "$title",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.manrope(
                  color: colorHexa("141414"),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 70,
            height: 28,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: colorHexa("7cc618"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  if (widget != null) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => widget,
                        ),
                        (route) => false);
                  }
                },
                child: const AutoSizeText(
                  "Xem",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
