import 'dart:async';

import 'package:difiaz_space/main_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            child: Image(
          image: AssetImage("images/logo_defiaz.png"),
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
