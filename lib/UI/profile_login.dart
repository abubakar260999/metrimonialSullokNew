import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../Global/constant.dart';
import 'notificaition.dart';
import 'outcome_screeen/user_confirmed.dart';

class profile_login extends StatefulWidget {
  @override
  _profile_loginState createState() => _profile_loginState();
}

class _profile_loginState extends State<profile_login> {
  @override
  TextEditingController contact_txt = TextEditingController();
  TextEditingController password_txt = TextEditingController();
  String? contact;
  String? password;
  TextEditingController progender = TextEditingController();
  String? pro_gender;
  bool password_view = false;

  var gender_list = [
    'Male',
    'Female',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                back_button(context),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome Back!",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: appcolor,
                        fontSize: 24.0,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Enter your Account details",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: appcolor,
                        fontSize: 16.0,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Material(
                  elevation: 10.0,
                  borderRadius: new BorderRadius.circular(20.0),
                  child: Container(
                    height: 58,
                    child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return "Plz Enter gender";
                        }
                      },
                      decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appcolor, width: 1.0),
//                      ),
//                      errorText: "",
//                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12.0),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      hint: pro_gender == null
                          ? Text(
                              'Gender',
                              style: TextStyle(
                                  // color: red,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              pro_gender!,
                              style: TextStyle(
                                  // color: red,
                                  fontWeight: FontWeight.bold),
                            ),
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined),
                      // iconEnabledColor: red,
                      // iconDisabledColor: red,
                      iconSize: 30.0,
                      style: TextStyle(
                          // color: red,
                          fontWeight: FontWeight.bold),
                      items: gender_list.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            pro_gender = val!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Material(
                  elevation: 10.0,
                  borderRadius: new BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {
                          contact = text;
                        });
                      },
                      controller: contact_txt,
                      decoration: new InputDecoration(
                        suffixIcon: Icon(
                          Icons.person_outline,
                          // color: red,
                          size: 25.0,
                        ),
                        hintText: "Contact",
                        hintStyle: TextStyle(
                          // color: red,
                          fontFamily: "poppins",
                        ),
                        fillColor: Colors.grey[400],
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: red, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: red, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide.none),
                      ),
                      style: new TextStyle(
                        // color: red,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Material(
                  elevation: 10.0,
                  borderRadius: new BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextFormField(
                      obscureText: password_view == false ? true : false,
                      onChanged: (text) {
                        setState(() {
                          password = text;
                        });
                      },
                      controller: password_txt,
                      decoration: new InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (password_view == false) {
                                password_view = true;
                              } else {
                                password_view = false;
                              }
                            });
                          },
                          child: Icon(
                            password_view == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 25.0,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontFamily: "poppins",
                        ),
                        fillColor: Colors.grey[400],
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: red, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: red, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () async {
                    if (pro_gender != null &&
                        contact_txt.text.isNotEmpty &&
                        password_txt.text.isNotEmpty) {
                      var collection = FirebaseFirestore.instance
                          .collection(pro_gender!)
                          .where('phno', isEqualTo: contact_txt.text)
                          .where('password', isEqualTo: password_txt.text);
                      var querySnapshots = await collection.get();
                      for (var snapshot in querySnapshots.docs) {
                        var documentID = snapshot.id;
                        print(documentID);
                        Map<String, dynamic> data = snapshot.data();
                        var name = data['name'];
                        if (documentID != '') {
                          print('print');
                          add_data_to_List(documentID, data['name'],
                              data['password'], data['gender']);
                          successful_Message();

                          Get.to(user_confirmed());

//                          Get.off(matrimonial_mainpage());
                        } else {
                          print("hell0");
                          invalid_Message();
                        }
//                      add_data_to_list(
//                        data['image'],
//                        data['id_card'],
//                        data['full_image'],
//                        data['name'],
//                        data['gender'],
//                        data['religion'],
//                        data['caste'],
//                        data['birth'],
//                        data['education'],
//                        data['profession'],
//                        data['salary'],
//                        data['height'],
//                        data['physique'],
//                        data['fmailymembers'],
//                        data['lifestandard'],
//                        data['martialstatus'],
//                        data['country'],
//                        data['city'],
//                        data['complexion'],
//                        data['phno'],
//                        data['desc'],
//                        data['l_caste'],
//                        data['l_start'],
//                        data['l_end'],
//                        data['l_education'],
//                        data['l_religion'],
//                        data['l_salary'],
//                        data['l_profession'],
//                        data['l_height'],
//                        data['l_martialstatus'],
//                        data['l_country'],
//                        data['l_city'],
//                        data['l_desc']);
//                      print( data['l_country']);
                      }
                    } else {
                      fill_Message();
                    }
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            appcolor,
                            AppColor.pink,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          'Next'.toUpperCase(),
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Container(
//                height: 20.0,
//                width: 20.0,
                            child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20.0,
                        )),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
