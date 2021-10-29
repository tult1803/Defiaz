import 'dart:convert';
import 'package:http/http.dart' as http;

class GetNotification {
  getNoti() async {
    try {
      var response = await http.get(
          Uri.parse("https://defiaz-api.herokuapp.com/noti"));

      print('Get API Get Notification: ${response.statusCode}');
      if (response.statusCode == 200) {
        // return notificationFromJson(response.body);
        return jsonDecode(response.body);
      } else {
        return [];
      }
    }catch(e){
      print(e);
    }
  }
}

