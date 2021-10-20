import 'package:difiaz_space/themes.dart';
import 'package:difiaz_space/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(
        create: (_) => AppTheme(),
        child:  const MyApp(),
      )
  );
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
bool switchTheme = false;
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();
  }

  getTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLightMode = prefs.getBool("light");
    setState(() {});
    if(isLightMode == false){
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
        theme: AppTheme.of(context,listen: true).currentTheme,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: WelcomePage(),
      ),
    );
  }
}

