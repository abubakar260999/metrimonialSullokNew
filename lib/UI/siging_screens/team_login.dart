//import 'package:flutter/material.dart';
//import 'package:metrimonialsulook/Global/constant.dart';
//import 'package:metrimonialsulook/UI/be_our_team.dart';
//import 'package:metrimonialsulook/UI/mainpage.dart';
//import 'package:metrimonialsulook/UI/notificaition.dart';
//import 'package:metrimonialsulook/upload.dart';
//
//class team_login extends StatefulWidget {
//  @override
//  _team_loginState createState() => _team_loginState();
//}
//
//class _team_loginState extends State<team_login> {
//  @override
//  TextEditingController name_txt = TextEditingController();
//  TextEditingController phno_txt = TextEditingController();
//  String name;
//  String phno;
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//        child: Padding(
//          padding: const EdgeInsets.all(20.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Container(
//                padding: const EdgeInsets.only(left: 10.0),
//                height: 40,
//                width: MediaQuery.of(context).size.width,
//                child: Align(
//                  alignment: Alignment.center,
//                  child: Text(
//                    "Welcome Back",
//                    maxLines: 1,
//                    overflow: TextOverflow.ellipsis,
//                    style: TextStyle(
//                      color: purple,
//                      fontSize: 20.0,
//                      fontFamily: "poppins",
//                      fontWeight: FontWeight.w700,
//                    ),
//                  ),
//                ),
//              ),
//
//              SizedBox(
//                height: 30.0,
//              ),
//
//              Material(
//                elevation: 10.0,
//                borderRadius: new BorderRadius.circular(10.0),
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 50,
//                  child: TextFormField(
//                    onChanged: (text) {
//                      setState(() {
//                        name= text;
//                      });
//                    },
//                    controller:name_txt ,
//                    decoration: new InputDecoration(
//                      suffixIcon: Icon(
//                        Icons.person_outline,
//                        color: purple,
//                        size: 25.0,
//                      ),
//                      hintText: "CNIC NAME",
//                      hintStyle: TextStyle(
//                        color: purple,
//                        fontFamily: "poppins",
//                      ),
//                      fillColor: Colors.grey[400],
////                      enabledBorder: OutlineInputBorder(
////                        borderSide: BorderSide(color: purple, width: 2.0),
////                        borderRadius: new BorderRadius.circular(10.0),
////                      ),
////                      focusedBorder: OutlineInputBorder(
////                        borderSide: BorderSide(color: purple, width: 2.0),
////                        borderRadius: new BorderRadius.circular(10.0),
////                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                    ),
//                    style: new TextStyle(
//                      fontFamily: "Poppins",
//                    ),
//                  ),
//                ),
//              ),
//
//
//              SizedBox(
//                height: 30.0,
//              ),
//
//              Material(
//                elevation: 10.0,
//                borderRadius: new BorderRadius.circular(10.0),
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 50,
//                  child: TextFormField(
//                    onChanged: (text) {
//                      setState(() {
//                        phno=text;
//                      });
//                    },
//                    controller: phno_txt,
//                    decoration: new InputDecoration(
//                      suffixIcon: Icon(
//                        Icons.vpn_key_outlined,
//                        color: purple,
//                        size: 25.0,
//                      ),
//
//
//                      hintText: "Phone Number",
//                      hintStyle: TextStyle(
//                        color: purple,
//                        fontFamily: "poppins",
//                      ),
//                      fillColor: Colors.grey[400],
////                      enabledBorder: OutlineInputBorder(
////                        borderSide: BorderSide(color: purple, width: 2.0),
////                        borderRadius: new BorderRadius.circular(10.0),
////                      ),
////                      focusedBorder: OutlineInputBorder(
////                        borderSide: BorderSide(color: purple, width: 2.0),
////                        borderRadius: new BorderRadius.circular(10.0),
////                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                    ),
//                    style: new TextStyle(
//                      fontFamily: "Poppins",
//                    ),
//                  ),
//                ),
//              ),
//
//              SizedBox(
//                height: 30.0,
//              ),
//
//              GestureDetector(
//                onTap: (){
//                  if(name_txt.text.isNotEmpty && phno_txt.text.isNotEmpty)
//
//                  login_team(name_txt.text,phno_txt.text,context);
////                  print(result);
////                  if(result=="done")
////                    {
////                      print(result);
////                      authentication_Message();
////                      Navigator.push(context, MaterialPageRoute(builder: (context) => Mainpage(),));
////                      name_txt.clear();
////                      phno_txt.clear();
////                    }
////                  else{
////                    invalid_Message();
////                  }
//
//
////                  }
//                  else{
//                   fill_Message();
//                  }
//
//                },
//                child: Container(
//                  height: 45,
//                  width: MediaQuery.of(context).size.width,
//                  decoration: BoxDecoration(
//                      gradient: LinearGradient(
//                        colors: [
//                          light_blue,
//                          purple,
//                        ],
//                      ),
//                      borderRadius: BorderRadius.all(Radius.circular(10))),
//                  child: Row(
//                    children: [
//
//
//                      Spacer(),
//                      Text(
//                        'Next'.toUpperCase(),
//                        style: TextStyle(
//                            fontFamily: "poppins",
//                            fontSize: 20.0,
//                            color: Colors.white,
//                            fontWeight: FontWeight.bold),
//                      ),
//
//                      Container(
//                        width: MediaQuery.of(context).size.width*0.3,
//                      ),
//
//                      Container(
////                height: 20.0,
////                width: 20.0,
//                          child: Icon(
//                            Icons.arrow_forward_ios,
//                            color: Colors.white,
//                            size: 20.0,
//                          )),
//                      SizedBox(
//                        width: 20.0,
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//
//
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
