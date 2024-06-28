// import 'package:flutter/material.dart';
//
// import '../Global/constant.dart';
// import '../UI/mainpage.dart';
//
// class Signuppage extends StatefulWidget {
//   @override
//   _SignuppageState createState() => _SignuppageState();
// }
//
// class _SignuppageState extends State<Signuppage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.purple,
//         toolbarHeight: 100.0,
//         title: Center(
//           child: Text(
//             "Create an Account!".toUpperCase(),
//             style: TextStyle(
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(10),
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
//                 height: 30.0,
//               ),
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
//                 height: 20.0,
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
//                 height: 20.0,
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
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       icon: Icon(
//                         Icons.vpn_key,
//                         color: AppColor.purple,
//                       ),
//                       hintText: 'Confirm password',
//                       hintStyle: TextStyle(
//                         fontSize: 19.0,
//                       )),
//                 ),
//               ),
//
//               SizedBox(
//                 height: 70.0,
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
//                       'Continue'.toUpperCase(),
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }
