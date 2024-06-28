import 'package:flutter/material.dart';

import '../../Global/constant.dart';

class coming_soon extends StatefulWidget {
  @override
  _coming_soonState createState() => _coming_soonState();
}

class _coming_soonState extends State<coming_soon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: concolor,
      floatingActionButton: float_back_button(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("Assets/images/coming_soon.png"),
        )),
      ),
    );
  }
}
