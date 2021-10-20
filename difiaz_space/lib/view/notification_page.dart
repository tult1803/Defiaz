import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotiAppBar extends StatefulWidget {
  const NotiAppBar({Key? key}) : super(key: key);

  @override
  _NotiAppBarState createState() => _NotiAppBarState();
}

class _NotiAppBarState extends State<NotiAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingAppbar(context, colorIcon: colorLeadingAppbar),
        centerTitle: true,
        backgroundColor: backgroundColorAppBar,
        elevation: 0,
        title: Text(
          "Thông báo",
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: colorLeadingAppbar),
        ),
      ),
    );
  }

}