
import 'package:difiaz_space/view/favorite/favorite_page.dart';
import 'package:difiaz_space/view/home/home_page.dart';
import 'package:difiaz_space/view/profile/profile_page.dart';
import 'package:difiaz_space/view/search/search_page.dart';
import 'package:intl/intl.dart';

indexWidgetMainPage({required int index}){
  switch(index){
    case 0: return HomePage();
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