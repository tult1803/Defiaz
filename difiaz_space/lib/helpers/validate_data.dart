
import 'package:difiaz_space/view/favorite/favorite_page.dart';
import 'package:difiaz_space/view/home/home_page.dart';
import 'package:difiaz_space/view/profile/profile_page.dart';
import 'package:difiaz_space/view/search/search_page.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';

import 'color.dart';

indexWidgetMainPage({required int index}){
  switch(index){
    case 0: return HomePage(index: 0,);
    case 1: return SearchPage();
    case 2: return FavoritePage();
    case 3: return ProfilePage();
  }
}

//Format giá 100.000.000
getFormatPrice(String price) {
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  return oCcy.format(double.parse("$price"));
}

//Share bài viết
shareBlog({mainUrl, title, redirectUrl}) async {
  await FlutterShare.share(
    title: mainUrl,
    text: title,
    linkUrl: redirectUrl,
  );
}

getDateTime(String date){
  DateTime dateF = DateTime.parse(date);
  return DateFormat('MM:HH dd/MM').format(dateF);
}

checkFullName(String name) {
  if (name == "null" || name == "") {
    return "Tên đang trống";
  }
  return null;
}

checkEmail(String email) {
  if (email == "null" || email == "") {
    return "Email đang trống";
  }else{
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(!emailValid){
      return "Kiểm tra lại email";
    }
  }
  return null;
}

checkMessage(String message) {
  if (message == "null" || message == "") {
    return "Nội dung đang trống";
  }
  return null;
}