import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/model/get/get_noti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotiAppBar extends StatefulWidget {
  const NotiAppBar({Key? key}) : super(key: key);

  @override
  _NotiAppBarState createState() => _NotiAppBarState();
}

class _NotiAppBarState extends State<NotiAppBar> {
  getData() async {
    GetNotification getNotification = GetNotification();
    final notiObject = await getNotification.getNoti();
    mapNoti = notiObject['data'];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
      body: SizedBox(
        child: mapNoti != null
            ? ListView.builder(
                itemCount: mapNoti!.length,
                itemBuilder: (context, index) {
             if(index < 11) {
               int newIndex = mapNoti!.length - 1;
                    return containerNoti(
                   title: "${mapNoti!.values.elementAt(newIndex - index)["content"]}",
                   subTitle:
                   "${mapNoti!.values.elementAt(newIndex - index)["content"]}");
             }else {
               return Container();
             }
                },
              )
            : Container(),
      ),
    );
  }

  Widget containerNoti({required title, required subTitle}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "$title",
            maxLines: 2,
            style: const TextStyle(fontSize: 16),
          ),
          AutoSizeText(
            "$subTitle",
            maxLines: 2,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
