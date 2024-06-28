import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Global/constant.dart';
import '../../Modal/personmodel.dart';

class prefectmatch extends StatefulWidget {
  @override
  _prefectmatchState createState() => _prefectmatchState();
}

List categories = [
  "Make your Profile",
  "Your Matches",
  "Profile matches you",
  "perfect Match",
  "Search here",
];

List images = [
  "assets/images/profile.png",
  "assets/images/yourmatches.png",
  "assets/images/youmatch.png",
  "assets/images/match.png",
  "assets/images/Search.png",
];

class _prefectmatchState extends State<prefectmatch> {
  @override
  void initState() {
    super.initState();
    data_function();
  }

  List? data;
  String age = "";
  String caste = "";
  String profession = "";
  String education = "";
  String country = "";

  String l_start = "";
  String l_end = "";
  String l_caste = "";
  String l_profession = "";
  String l_education = "";
  String l_country = "";

  var gender = "";
  var name = "";
  var password = "";

  data_function() async {
    data = await read_data_of_list();
    if (data != null) {
      name = data![1];
      password = data![2];
      gender = data![3];
    }
    setState(() {
      print(gender);
    });

    var collection = FirebaseFirestore.instance
        .collection(gender)
        .where('name', isEqualTo: name)
        .where('password', isEqualTo: password);
    var querySnapshots = await collection.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id;
      print(documentID);
      Map<String, dynamic> data = snapshot.data();
      var name = data['name'];
      if (documentID != '') {
        l_caste = data['l_caste'];
//        age = data['birth'];
        l_education = data['l_education'];
        l_profession = data['l_profession'];
//        salary = data['salary'];
//                      print( data['l_country']);

        caste = data['caste'];
//        age = data['birth'];
        education = data['education'];
        profession = data['profession'];
      }
      setState(() {});
      print(l_caste);
      print(l_education);
      print(l_profession);
      getperson();
    }
  }

  Stream<List<Person>> getperson() => FirebaseFirestore.instance
      .collection(gender == 'Male' ? 'Female' : 'Male')
      .where('profession', isEqualTo: l_profession)
      .where('education', isEqualTo: l_education)
      .where('caste', isEqualTo: l_caste)
      .where('l_profession', isEqualTo: profession)
      .where('l_education', isEqualTo: education)
      .where('l_caste', isEqualTo: caste)
//      .where('birth', isGreaterThanOrEqualTo: l_start)
//          .where('birth', isLessThanOrEqualTo: l_end)
      .snapshots()
      .map(
          (event) => event.docs.map((e) => Person.fromJson(e.data())).toList());

//  data_function() async {
//    data=await read_data_of_list();
//    setState(() {
//      print("my profile data"+data.toString());
//    });
//
//    if(data !=null) {
//      age = data[5];
//      caste = data[4];
//      profession = data[7];
//      education = data[6];
//      country = data[28];
//      l_start = data[20];
//      l_end = data[21];
//      look_caste = data[19];
//      look_profession = data[25];
//      look_education = data[22];
//      look_country = data[28];
//    }
//
//  }

//  Stream<List<Person>> getperson() =>
//      FirebaseFirestore.instance.collection('Male').
//      where('l_country', isEqualTo: country).
//      where('l_profession', isEqualTo: profession)
//          .where('l_education', isEqualTo: education)
//      .where('birth', isGreaterThanOrEqualTo: l_start)
//          .where('birth', isLessThanOrEqualTo: l_end)
  //loool caste match
//          .where('l_caste', isGreaterThan: caste).
//      where('country', isEqualTo: look_country).
//      where('profession', isEqualTo: look_profession)
//      .where('education', isEqualTo: look_education)
//      .where('birth', isGreaterThanOrEqualTo: l_start)
//          .where('birth', isLessThanOrEqualTo: l_end)
//       where('l_caste', isGreaterThan: look_caste).
//          snapshots().map((event) =>
//          event.docs.map((e) => Person.fromJson(e.data())).toList());

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: concolor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                back_button(context),
                SizedBox(
                  height: 20.0,
                ),
                name != ""
                    ? StreamBuilder<List<Person>>(
                        stream: getperson(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data != null) {
                              return profile_first_page(snapshot);
                            } else {
                              return no_data(context);
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: appcolor,
                              ),
                            );
//                        if(snapshot.data !=null)
//                        {
//
//                          return profile_first_page(snapshot);
//
//                        }
//                        else{
//                          return no_data(context);
//                        }
                          }
                        })
                    : signin_first(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
