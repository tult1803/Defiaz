import 'dart:convert';

import 'package:difiaz_space/helpers/url.dart';
import 'package:http/http.dart' as http;
import '../model_data_categories_blog.dart';

class GetCCountViewBlog {
  getData() async {
    try {
      var response = await http.get(
          Uri.https(urlDefiaz, subUrl),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          });
      print('Get API Blog Count View: ${response.statusCode}');
      if (response.statusCode == 200) {
        return categoriesBlogFromJson(response.body);
      } else {
        return [];
      }
    }catch(e){
      print(e);
    }
  }
}
