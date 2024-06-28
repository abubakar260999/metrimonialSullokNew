import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/UI/siging_screens/signin.dart';
import 'package:metrimonialsullokupdated/common_widget.dart';

import '../../Global/constant.dart';
import '../mainpage.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "Assets/images/cartoon.png",
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width,
              ),

//
              Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Center(
//                              "Let's Get Started!"
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),

//                        Expanded(
//                          child: FittedBox(
//                            fit: BoxFit.scaleDown,
//                            child: Center(
//                            child: Center(
//                              child: Text("Create an account to Sportx to get all features",
//                                style: TextStyle(
//                                  fontWeight: FontWeight.w400,
//                                  color: Colors.grey[500],
//                                  fontSize: 12.0,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Theme(
                              data: ThemeData(hintColor: Colors.transparent),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: new BorderRadius.circular(10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: AppColor.purple,
                                        width: 0.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(
                                          color: AppColor.purple),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Theme(
                              data: ThemeData(hintColor: Colors.transparent),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: new BorderRadius.circular(10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: AppColor.purple,
                                        width: 0.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(
                                          color: Colors.transparent),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          //contact

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Theme(
                              data: ThemeData(hintColor: Colors.transparent),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: new BorderRadius.circular(10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: AppColor.purple,
                                        width: 0.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(
                                          color: AppColor.purple),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColor.purple,
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: Theme(
                              data: ThemeData(hintColor: Colors.transparent),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: new BorderRadius.circular(10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: AppColor.purple,
                                        width: 0.0,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(
                                          color: AppColor.purple),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Repeat Password",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),

                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: GestureDetector(
                                child: Center(
                                    child: Text(
                                  "Already have an account?Sign in",
                                  style: TextStyle(color: appColor),
                                )),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => signin(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),

                          Material(
                            elevation: 5.0,
                            borderRadius: new BorderRadius.circular(10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mainpage()),
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColor.purple,
                                        AppColor.pink,
                                      ],
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    'Create'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
