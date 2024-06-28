//import 'package:flutter/gestures.dart';
//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:metrimonialsulook/Global/constant.dart';
//import 'package:metrimonialsulook/UI/be_our_team.dart';
//import 'package:metrimonialsulook/UI/siging_screens/team_login.dart';
//
//class team_first_screen extends StatefulWidget {
//  @override
//  _team_first_screenState createState() => _team_first_screenState();
//}
//
//class _team_first_screenState extends State<team_first_screen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: light_blue,
//      appBar: AppBar(
//        elevation: 0.0,
//      backgroundColor: light_blue,
//      leadingWidth: 120,
//
//        leading:  Padding(
//          padding: const EdgeInsets.all(10.0),
//          child: GestureDetector(
//            onTap: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context) => team_login(),));
//            },
//            child: Container(
//              height: 40,
//              width: 120,
//              decoration: BoxDecoration(
//                color:    purple,
////                  gradient: LinearGradient(
////                    colors: [
////                      light_blue,
////                      purple,
////                    ],
////                  ),
//                  borderRadius: BorderRadius.all(Radius.circular(10))),
//              child: Row(
//                children: [
//
//                  SizedBox(width: 5.0,),
//                  Icon(
//                    Icons.arrow_back_ios,
//                    color: Colors.white,
//                    size: 20.0,
//                  ),
//
//                  Container(
//                    width: 5.0,
//                  ),
//
//                  Container(
//                    width: 50.0,
//                    child: Text(
//                      'back'.toUpperCase(),
//                      style: TextStyle(
//                          fontFamily: "poppins",
//                          fontSize: 14.0,
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold),
//                    ),
//                  ),
//
//                  SizedBox(width: 5.0,),
//
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//      body: Container(
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//
//           children: [
//
//
//             GestureDetector(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => team_login(),));
//               },
//               child: Container(
//                 height: 60,
//                 width: MediaQuery.of(context).size.width*0.6,
//                 decoration: BoxDecoration(
//                   color: purple,
////                     gradient: LinearGradient(
////                       colors: [
////                         light_blue,
////                         purple,
////                       ],
////                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 child: Row(
//                   children: [
//
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.1,
//                     ),
//
//                     Text(
//                       'signin'.toUpperCase(),
//                       style: TextStyle(
//                           fontFamily: "poppins",
//                           fontSize: 20.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//
//                     Container(
//                       width: MediaQuery.of(context).size.width*0.1,
//                     ),
//
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.white,
//                       size: 20.0,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.1,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             SizedBox(
//               height: 30.0,
//             ),
//
//             GestureDetector(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => be_our_team(),));
//               },
//               child: Container(
//                 height: 60,
//                 width: MediaQuery.of(context).size.width*0.6,
//                 decoration: BoxDecoration(
//                   color: purple,
////                     gradient: LinearGradient(
////                       colors: [
////                         light_blue,
////                         purple,
////                       ],
////                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 child: Row(
//                   children: [
//
//
//                     SizedBox
//                       (
//                       width: MediaQuery.of(context).size.width*0.1,
//                     ),
//
//                     Text(
//                       'signup'.toUpperCase(),
//                       style: TextStyle(
//                           fontFamily: "poppins",
//                           fontSize: 20.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//
//                     Container(
//                       width: MediaQuery.of(context).size.width*0.1,
//                     ),
//
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.white,
//                       size: 20.0,
//                     ),
//
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.1,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//      ),
//    );
//  }
//}
