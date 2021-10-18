//Đổi màu và icon cho nút back screen
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget leadingAppbar(BuildContext context, {Widget? widget, Color? colorIcon}) {
  return IconButton(
    icon: Icon(Icons.arrow_back_ios_outlined,
        color: colorIcon ?? Colors.white),
    onPressed: () => widget != null
        ? Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false)
        : Navigator.of(context).pop(),
  );
}
Widget newPageProgressIndicatorBuilder() {
  return Center(
    child: CircularProgressIndicator(
      color: colorHexa("aff022"),
    ),
  );
}

// Dùng cho PagedChildBuilderDelegate trong PagedSliverList
Widget firstPageProgressIndicatorBuilder() {
  return Center(
    child: CircularProgressIndicator(
      color: colorHexa("aff022"),
    ),
  );
}

// Dùng cho PagedChildBuilderDelegate trong PagedSliverList
Widget firstPageErrorIndicatorBuilder(BuildContext context, {String? tittle}) {
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: 50,
    child: Center(
        child: AutoSizeText(
          "$tittle",
          style: const TextStyle(color: Colors.black54, fontSize: 16),
        )),
  );
}

//Dùng cho container show đã lưu, đã đọc, yêu thích trong trang profile
Widget columnShowSaveReadLike({title, value}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AutoSizeText("$value", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: colorColumnShowSaveReadLike),maxLines: 1, overflow: TextOverflow.ellipsis,),
      const SizedBox(height: 9,),
      Text("$title",style: GoogleFonts.manrope(color: colorHexa("aaaaaa")),),
    ],
  );
}

// Dùng cho trang Profile
Widget componentBottomProfile({title, Widget? widget, double? fontSize, fontWeight, Color? color, double? marginTop}) {
  return Container(
    margin: EdgeInsets.only(top: marginTop ?? 0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "$title",
                style: GoogleFonts.manrope(
                  color: color,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: widget,
            )
          ],
        )
      ],
    ),
  );
}
