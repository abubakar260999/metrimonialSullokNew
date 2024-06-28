import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../Global/constant.dart';
import 'Drawer/drawer.dart';
import 'mainpage.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        mainScreen: mainpage(),
        menuScreen: drawer(context),
        // style: DrawerStyle.defaultStyle,
        moveMenuScreen: true,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        menuBackgroundColor: concolor, //
        borderRadius: 30.0,
        showShadow: true,
        angle: 0.0,
        drawerShadowsBackgroundColor: (Colors.grey[300]!),
        // set slideWidth
      );
}
