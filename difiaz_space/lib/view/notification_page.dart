import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/helpers/colors.dart';
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
        leading: leadingAppbar(context, colorIcon: colorHexa("141414")),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Thông báo",
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: colorHexa("141414")),
        ),
      ),
    );
  }

}