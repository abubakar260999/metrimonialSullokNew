// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
//
// import 'Modal/professionmodel.dart';
//
// class Download {
//   static const caste_action = "load_castelist";
//   static const education_action = "load_educationlist";
//   static const profession_action = "load_professionlist";
//
// // static Future<List<Caste>> getcaste() async {
// //   try {
// ////      https://192.168.1.141
// //     String url = "http://localhost/sulook/download.php";
// //     var map = Map<String, dynamic>();
// //     map['action'] = caste_action;
// //     final response = await http.post(url, body: map);
// //
// //     print('h');
// //     print(response.body);
// //     if (response.statusCode == 200) {
// //       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
// //       print(json.decode(response.body).cast<Map<String, dynamic>>());
// //       return parsed.map<Caste>((json) => Caste.fromJson(json)).toList();
// //     }
// //     else {
// //       print("hello");
// //       return List<Caste>();
// //
// //     }
// //
// //     }
// //    catch(e){
// //      print("hell");
// //      return List<Caste>();
// //    }
// //  }
//
//   static Future<List<Education>> geteducation() async {
//     try {
// //      https://192.168.1.141
//       String url = "http://localhost/sulook/download.php";
//       var map = Map<String, dynamic>();
//       map['action'] = education_action;
//       final response = await http.post(url, body: map);
//
//       print(response.body);
//       if (response.statusCode == 200) {
//         final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//         print(json.decode(response.body).cast<Map<String, dynamic>>());
//         return parsed
//             .map<Education>((json) => Education.fromJson(json))
//             .toList();
//       } else {
//         return List<Education>();
//       }
//     } catch (e) {
//       return List<Education>();
//     }
//   }
//
//   static Future<List<Profession?>> getprofession() async {
//     try {
// //      https://192.168.1.141
//       String? url = "http://localhost/sulook/download.php";
//       var map = Map<String, dynamic>();
//       map['action'] = profession_action;
//       final response = await http.post(url, body: map);
//
//       print(response.body);
//       if (response.statusCode == 200) {
//         final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//         print(json.decode(response.body).cast<Map<String, dynamic>>());
//         return parsed
//             .map<Profession>((json) => Profession.fromJson(json))
//             .toList();
//       } else {
//         return List<Profession>();
//       }
//     } catch (e) {
//       return List<Profession>();
//     }
//   }
// }
