import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/common_widget.dart';

import '../Global/constant.dart';
import 'home.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => home(),
            )));
  }

  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/images/sulook_logo.png",
              height: 300,
              width: MediaQuery.of(context).size.width * 0.80,
              color: appcolor,
            ),
            Text(
              app_name,
              style: TextStyle(
                color: appcolor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: "cabin",
              ),
            )
          ],
        ),
      ),
    );
  }
}
