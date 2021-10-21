import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:difiaz_space/components/component.dart';
import 'package:difiaz_space/helpers/color.dart';
import 'package:difiaz_space/helpers/colors.dart';
import 'package:difiaz_space/themes.dart';
import 'package:difiaz_space/view/profile/send_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<bool> showQty = [true, true];
  bool isDown = true, switchNoti = true, switchComment = false;
AppTheme? theme;

  @override
  void didChangeDependencies() {
    theme ?? AppTheme.of(context);
    super.didChangeDependencies();
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  void showHide(int i) {
    setState(() {
      showQty[i] = !showQty[i];
      isDown = !isDown;
    });
  }

  @override
  Widget build(BuildContext context) {
    theme = AppTheme.of(context);
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        showAvata(size: size, img: "images/logoDe.png", name: "Defiaz"),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  // ItemCount = 2 là có tiện ích vs cài đặt
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 15.5, left: 25, right: 25, bottom: 14),
                              height: 1,
                              color: colorHexa("707070")),
                          Container(
                            margin: const EdgeInsets.only(left: 38, right: 38),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showHide(index);
                                  },
                                  child: componentBottomProfile(
                                      title:"CÀI ĐẶT",
                                          // index == 0 ? "TIỆN ÍCH" : "CÀI ĐẶT",
                                      widget: Icon(showQty[index]
                                          ? Icons.keyboard_arrow_down
                                          : Icons.keyboard_arrow_up),
                                      color: colorTitleComponentBottomProfile,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                showQty[index] ?
                                    // ? index == 0
                                    //     ? Container():
                                    settingProfile()
                                    // : index == 0
                                    //     ? Container()
                                        : Container()
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                Container(
                    margin: const EdgeInsets.only(
                        top: 15.5, left: 25, right: 25, bottom: 14),
                    height: 1,
                    color: colorHexa("707070")),
                btnSendEmail(size),
                // btnSignOut(size),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget showAvata({size, img, name}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: size.width,
      child: Column(
        children: [
          CircleAvatar(
            child: Image.asset(img),
            backgroundColor: Colors.white10,
            maxRadius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            name,
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500,
                color: colorTitleShowAvata,
                fontSize: 18),
            maxLines: 1,
          ),
          topContainerProfile(size: size, saved: 42, read: 84, like: 14),
        ],
      ),
    );
  }

  Widget topContainerProfile({size, saved, read, like}) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorHexa("f2f2f2"), width: 1.2),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: columnShowSaveReadLike(title: "Đã lưu", value: saved)),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: 1,
              color: colorHexa("f2f2f2")),
          Expanded(
              flex: 1,
              child: columnShowSaveReadLike(title: "Đã đọc", value: read)),
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: 1,
              color: colorHexa("f2f2f2")),
          Expanded(
              flex: 1,
              child: columnShowSaveReadLike(title: "Yêu thích", value: like)),
        ],
      ),
    );
  }

  Widget settingProfile() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        // GestureDetector(
        //     onTap: () {
        //       print('Click Thông tin cá nhân');
        //     },
        //     child: componentBottomProfile(
        //         title: "Thông tin cá nhân",
        //         widget: Container(),
        //         color: colorComponentBottomProfile)),
        componentBottomProfile(
            title: "Theme",
            widget: Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: switchTheme,
                onChanged: (value) async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  isLightMode = !value;
                      prefs.setBool("light", !value);
                  print('Set isLightMode: $isLightMode');
                  await theme?.switchTheme();
                  switchTheme = value;
                  setState(() {});
                  // Navigator.of(context).pushAndRemoveUntil(M, (route) => false)
                },
              ),
            ),
            marginTop: 10,
            color: colorComponentBottomProfile),
        // componentBottomProfile(
        //     title: "Báo tin nổi bật",
        //     widget: Transform.scale(
        //       scale: 0.7,
        //       child: CupertinoSwitch(
        //         value: switchNoti,
        //         onChanged: (value) {
        //           setState(() {
        //             switchNoti = value;
        //           });
        //         },
        //       ),
        //     ),
        //     marginTop: 10,
        //     color: colorComponentBottomProfile),
        // componentBottomProfile(
        //     title: "Bình luận có trả lời mới",
        //     widget: Transform.scale(
        //       scale: 0.7,
        //       child: CupertinoSwitch(
        //         value: switchComment,
        //         onChanged: (value1) {
        //           setState(() {
        //             switchComment = value1;
        //           });
        //         },
        //       ),
        //     ),
        //     color: colorComponentBottomProfile),
      ],
    );
  }

  Widget btnSendEmail(size) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendEmail()));
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(
            left: 38,
            right: 38,
            bottom: 10
        ),
        width: size.width,
        child: Text(
          "EMAIL GÓP Ý, BÁO LỖI",
          style: GoogleFonts.manrope(
            color: colorComponentBottomProfile,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget btnSignOut(size) {
    return GestureDetector(
      onTap: () {
        print('Click Sign Out button');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(
          left: 38,
          right: 38,
          bottom: 10
        ),
        width: size.width,
        child: Text(
          "ĐĂNG XUẤT",
          style: GoogleFonts.manrope(
            color: colorComponentBottomProfile,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
