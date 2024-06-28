import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../Global/constant.dart';
import '../Metrimonial_mainpage.dart';
import '../mainpage.dart';

class user_confirmed extends StatefulWidget {
  @override
  _user_confirmedState createState() => _user_confirmedState();
}

class _user_confirmedState extends State<user_confirmed> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offAll(mainpage());
      Get.to(matrimonial_mainpage());
    });

//       Navigator.push(context, MaterialPageRoute(builder: (context) => matrimonial_mainpage(),));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_pink,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),

                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        "Done",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
//                          color:Color(0xff32D554),
                          color: appcolor,
                          fontSize: 30.0,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60.0,
                ),

                Image.asset(
                  "Assets/images/user_confiremed.png",
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: appcolor,
                ),

                SizedBox(
                  height: 60.0,
                ),

//                GestureDetector(
//                onTap: (){
//                  Get.offAll(search());
//                },
//                  child: Container(
//                    height: 40,
//                    width: MediaQuery.of(context).size.width*0.6,
//                    decoration: BoxDecoration(
//                    color: appcolor,
//                        borderRadius: BorderRadius.all(Radius.circular(10))),
//
//                        child:Container(
//                          height: 40,
//                          width: MediaQuery.of(context).size.width*0.6,
//
//                          child: Center(
//                            child: Text(
//                              'View Partner'.toUpperCase(),
//                              style: TextStyle(
//                                  fontFamily: "poppins",
//                                  fontSize: 18.0,
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                          ),
//                        ),
//
////                      Container(
////                        width: MediaQuery.of(context).size.width*0.3,
////                      ),
////
////                      Container(
//////                height: 20.0,
//////                width: 20.0,
////                          child: Icon(
////                            Icons.arrow_forward_ios,
////                            color: Colors.white,
////                            size: 20.0,
////                          )),
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
