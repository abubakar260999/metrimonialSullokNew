import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Global/constant.dart';
import '../../Modal/personmodel.dart';

class youmatch extends StatefulWidget {
  @override
  _youmatchState createState() => _youmatchState();
}

class _youmatchState extends State<youmatch> {
  @override
  void initState() {
    super.initState();
    data_function();
  }

  var gender = "";
  var name = "";
  var password = "";

  String age = "";
  String caste = "";
  String profession = "";
  String education = "";
//  String country="" ;

  List data = [];
  data_function() async {
    data = await read_data_of_list();
    if (data != null) {
      name = data[1];
      password = data[2];
      gender = data[3];
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
        caste = data['caste'];
        age = data['birth'];
        education = data['education'];
        profession = data['profession'];

//        salary = data['salary'];
//                      print( data['l_country']);
      }
      setState(() {});
      print(caste);
      print(education);
      print(profession);
      getperson();
    }
  }

  Stream<List<Person>> getperson() => FirebaseFirestore.instance
      .collection(gender == 'Male' ? 'Female' : 'Male')
      .where('l_profession', isEqualTo: profession)
      .where('l_education', isEqualTo: education)
      .where('l_caste', isEqualTo: caste)
//      .where('birth', isGreaterThanOrEqualTo: l_start)
//          .where('birth', isLessThanOrEqualTo: l_end)
      .snapshots()
      .map(
          (event) => event.docs.map((e) => Person.fromJson(e.data())).toList());

  Widget build(BuildContext context) {
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
