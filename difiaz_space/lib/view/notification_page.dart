import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/helpers/data.dart';
import 'package:difiaz_space/main_page.dart';
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
        leading: leadingAppbar(context, colorIcon: colorLeadingAppbar, widget: MainPage()),
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
                   title: "${mapNoti!.values.elementAt(newIndex - index)["title"]}",
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorContainerPopualarMedia,
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "$title",
              maxLines: 2,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            AutoSizeText(
              "$subTitle",
              style:  TextStyle(color: colorTitleContainerSpecialForYou),
            ),
          ],
        ),
      ),
    );
  }
}
