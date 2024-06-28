import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:metrimonialsullokupdated/UI/yourprofile.dart';

import '../Global/constant.dart';
import '../common_widget.dart';
import 'add_forms/profile_image_Screen.dart';
import 'matches/prefectmatch.dart';
import 'matches/search.dart';
import 'matches/youmatch.dart';
import 'matches/yourmatches.dart';

class matrimonial_mainpage extends StatefulWidget {
  @override
  _matrimonial_mainpageState createState() => _matrimonial_mainpageState();
}

class _matrimonial_mainpageState extends State<matrimonial_mainpage> {
  @override
//  final  matrimonial_pagess = <Widget>[];
  List categories = [
    "Create Canidate Profile",
    // "Login Canidate Profile",
    "Search here",
    "Your Matches",
    "People looking for you",
    "Perfect Match",

//    "Contact us"
  ];

//  List<Color> colors = [
//    Color(0xff935CFF),
//    Color(0xffDF6563),
//    Color(0xffFFADAD),
//    Color(0xffFFDB76),
//    Color(0xff8EE7D9),
//  ];

  List images = [
    "Assets/images/profile.png",
    // "Assets/images/login.png",
    "Assets/images/search.png",
    "Assets/images/yourmatches.png",
    "Assets/images/youmatch.png",
    "Assets/images/match.png",
//    "Assets/images/admin.png"
  ];

  List<Widget> matrimonial_pages = [
    profile_image_screen(),
    // profile_login(),
    search(),
    yourmtches(),
    youmatch(),
    prefectmatch(),
//    admin(),
  ];

  Widget build(BuildContext context) {
    return SafeArea(
        child: BaseScaffold(
            child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            toolbarHeight: 80,
            titleSpacing: 0.0,
            floating: true,
            // backgroundColor: concolor,
            elevation: 0.0,
            leadingWidth: 80,
            centerTitle: true,

            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
//         Get.offAll(Mainpage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.purple,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30.0,
                          // color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => yourprofile(),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.purple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          CupertinoIcons.person,
                          size: 30.0,
                          // color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],

//            flexibleSpace: FlexibleSpaceBar(
//              title: Padding(
//                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                child: Row(
//                  children: [
//                    Material(
//                      elevation: 10.0,
//                      borderRadius: BorderRadius.circular(10.0),
//                      child: Container(
//                        decoration: BoxDecoration(
//                          color: Colors.white70,
//                          borderRadius: BorderRadius.circular(10.0),
//
//                        ),
//                        child: Padding(
//                          padding: const EdgeInsets.all(10.0),
//                          child: Icon(Icons.menu_outlined,
//                            size: 30.0,
//                            color: black,),
//                        ),
//
//                      ),
//                    ),
//                    Spacer(),
//
//                    Material(
//                      elevation: 10.0,
//                      borderRadius: BorderRadius.circular(10.0),
//                      child: GestureDetector(
//                        onTap: (){
//                          Navigator.push(context, MaterialPageRoute(builder: (context) => team_profile(),));
//                        },
//
//                        child: Container(
//                          decoration: BoxDecoration(
//                            color: Colors.white70,
//                            borderRadius: BorderRadius.circular(10.0),
//
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.all(10.0),
//                            child: Icon(Icons.group_outlined,
//                              size: 30.0,
//                              color: black,),
//                          ),
//
//                        ),
//                      ),
//                    ),
//
//                  ],
//                ),
//              ),
//
          ),
        ];
      },
      body: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
//                        if(index==0)
//                          {
//                            Navigator.pushReplacement(context,
//                                MaterialPageRoute(builder:
//                                    (context) =>Metrimonail_support()));
//
//                          }

                Get.to(matrimonial_pages[index]);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 20.0),
                child: Card(
                    elevation: 10.0,
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: AppColor.purple,
                    shadowColor: AppColor.purple,
//                                color:colors[index],
//                                shadowColor: colors[index],
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(images[index],
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            width: 10,
                          ),
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width - 120,
                            child: Center(
                              child: Text(
                                categories[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  // color: contrastColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          }),
    )));
  }
}
