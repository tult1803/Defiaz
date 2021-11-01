
import 'package:difiaz_space/model/model_data_categories_blog.dart';
import 'package:difiaz_space/view/favorite/favorite_page.dart';
import 'package:difiaz_space/view/home/home_page.dart';
import 'package:difiaz_space/view/profile/profile_page.dart';
import 'package:difiaz_space/view/search/search_page.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';


indexWidgetMainPage({required int index, int? indexHome}){
  switch(index){
    case 0: return HomePage(index: indexHome ?? 0,);
    case 1: return SearchPage();
    case 2: return FavoritePage();
    case 3: return ProfilePage();
  }
}

//Format giá 100.000.000
getFormatPrice(String price) {
  final oCcy = NumberFormat("#,##0.00", "en_US");
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


//Sort data blog
int sortPostViews(CategoriesBlog a, CategoriesBlog b) {
  final propertyA = int.tryParse("${a.countViews}");
  final propertyB = int.tryParse("${b.countViews}");
  if (propertyA! < propertyB!) {
    return 1;
  } else if (propertyA > propertyB) {
    return -1;
  } else {
    return 0;
  }
}