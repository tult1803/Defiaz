import 'dart:async';

import 'package:difiaz_space/main_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/messages.dart';
import 'main.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async{
      if (message != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isNewNoti", false);
        Navigator.pushNamed(context, '/message',
            arguments: MessageArguments(message, false));
      }else {
        _timer();
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        print('New Message');
        flutterLocalNotificationsPlugin?.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(context, '/message',
          arguments: MessageArguments(message, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.jpg"), fit: BoxFit.cover),
        ),
        child: const Center(
            child: Image(
          image: AssetImage("images/logo_defiaz1.png"),
          // color: Colors.white,
          height: 200,
          width: 200,
        )));
  }

  _timer() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
          (route) => false);
      // Dừng timer
      timer.cancel();
    });
  }
}
