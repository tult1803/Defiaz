import 'package:difiaz_space/themes.dart';
import 'package:difiaz_space/view/notification_page.dart';
import 'package:difiaz_space/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/colors.dart';

/// Initialize the [FlutterLocalNotificationsPlugin] package.
 FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

/// Create a [AndroidNotificationChannel] for heads up notifications
 AndroidNotificationChannel? channel;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  if (message.messageId != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isNewNoti", true);
    print('Handling a background message ${message.messageId}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );
  }
  runApp(ChangeNotifierProvider(
    create: (_) => AppTheme(),
    child: const MyApp(),
  ));

  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = colorHexa("7265fa")
    ..backgroundColor = Colors.white
    ..indicatorColor = colorHexa("7265fa")
    ..textColor = Colors.black87
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

bool? isLightMode;
bool? isNewNoti;
bool switchTheme = false;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();

    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? message) {
    //   print('FirebaseMessaging: ${message?.messageId}');
    //   // if (message != null) {
    //   //   print('RemoteMessage: $message');
    //   // }
    // });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseMessaging.instance.subscribeToTopic("news");
    if (prefs.getBool("isNewNoti") == true) {
      isNewNoti = true;
    } else {
      isNewNoti = false;
      prefs.setBool("isNewNoti", false);
    }
    print("isNewNoti: $isNewNoti");
    String? token = await FirebaseMessaging.instance.getToken();
    print("Token: $token");
    isLightMode = prefs.getBool("light");
    setState(() {});
    if (isLightMode == false) {
      switchTheme = true;
      await AppTheme.of(context).switchTheme();
    }
    print("isLightMode: $isLightMode");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        theme: AppTheme.of(context, listen: true).currentTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => WelcomePage(),
          '/message': (context) => NotiAppBar(),
        },
        builder: EasyLoading.init(),
        // home: WelcomePage(),
      ),
    );
  }
}
