import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/UI/contact_us.dart';

import '../../Global/constant.dart';
import '../about_us.dart';

drawer(context) {
  return Theme(
    data: Theme.of(context).copyWith(
        canvasColor:
            AppColor.purple //This will change the drawer background to blue.
        //other styles
        ),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 30.0, right: 20.0, bottom: 20.0),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => about_us(),
                        ));
                  },
                  leading: Icon(
                    CupertinoIcons.info,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  title: Text(
                    "About Us",
                    style: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => contact_us(),
                        ));
                  },
                  leading: Icon(
                    Icons.support_agent_outlined,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  title: Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'cabin',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
