import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Global/constant.dart';
import '../../Modal/personmodel.dart';

class yourmtches extends StatefulWidget {
  @override
  _yourmtchesState createState() => _yourmtchesState();
}

class _yourmtchesState extends State<yourmtches> {
  @override
  void initState() {
    super.initState();
    data_function();
  }

  var gender = "";
  var name = "";
  var password = "";

//  String age="";
  String l_caste = "";
  String l_profession = "";
  String l_education = "";

//  String country="" ;
//  l_start = data[20];
//  l_end = data[21];

  List? data;

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
//      .where('birth', isGreaterThanOrEqualTo: l_start)
//          .where('birth', isLessThanOrEqualTo: l_end)
      .snapshots()
      .map(
          (event) => event.docs.map((e) => Person.fromJson(e.data())).toList());

  Widget build(BuildContext context) {
//    String l_start = data[20];
//    String l_end=data[21];
//    String look_caste = data[19];
//    String look_profession = data[25];
//    String look_education = data[22];
//    String look_country = data[28];

    return Scaffold(
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
                        }
                      },
                    )
                  : signin_first(context),
            ],
          ),
        ),
      ),
    );
  }
}
