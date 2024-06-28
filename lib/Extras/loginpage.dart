// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import '../Global/constant.dart';
// import 'signuppage.dart';
//
// class Loginpage extends StatefulWidget {
//   @override
//   _LoginpageState createState() => _LoginpageState();
// }
//
// class _LoginpageState extends State<Loginpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.purple,
//         toolbarHeight: 150.0,
//         title: Center(
//           child: Text(
//             "Login".toUpperCase(),
//             style: TextStyle(
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: ListView(
//             physics: const AlwaysScrollableScrollPhysics(),
//             children: [
//               SizedBox(
//                 height: 40.0,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.2,
//                 height: 45,
//                 padding:
//                     EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(color: Colors.black12, blurRadius: 5)
//                     ]),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       icon: Icon(
//                         Icons.person,
//                         color: AppColor.purple,
//                       ),
//                       hintText: 'Name',
//                       hintStyle: TextStyle(
//                         fontSize: 19.0,
//                       )),
//                 ),
//               ),
//
//               SizedBox(
//                 height: 30.0,
//               ),
//
//               //contact
//
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.2,
//                 height: 45,
//                 padding:
//                     EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(color: Colors.black12, blurRadius: 5)
//                     ]),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       icon: Icon(
//                         Icons.vpn_key,
//                         color: AppColor.purple,
//                       ),
//                       hintText: 'Password',
//                       hintStyle: TextStyle(
//                         fontSize: 19.0,
//                       )),
//                 ),
//               ),
//
//               SizedBox(
//                 height: 5.0,
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 15),
//                   child: Text(
//                     'Forgot Password ?',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ),
//
//               SizedBox(
//                 height: 40.0,
//               ),
//
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => mainpage()),
//                   );
//                 },
//                 child: Container(
//                   height: 45,
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           AppColor.purple,
//                           AppColor.purple,
//                         ],
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(50))),
//                   child: Center(
//                     child: Text(
//                       'Login'.toUpperCase(),
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(
//                 height: 10,
//               ),
//               InkWell(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "Don't have an account ?",
//                       style: TextStyle(color: AppColor.purple),
//                     ),
//                     Text(
//                       "Sign Up",
//                       style: TextStyle(color: AppColor.purple),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   Timer(
//                       Duration(seconds: 2),
//                       () => Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Signuppage(),
//                           )));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
