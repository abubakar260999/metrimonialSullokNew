import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../Global/constant.dart';
import '../UI/Metrimonial_mainpage.dart';
import '../UI/mainpage.dart';
import '../UI/notificaition.dart';
import '../UI/yourprofile.dart';
import 'edit_main.dart';

class name_password_screen_edit extends StatefulWidget {
  @override
  _name_password_screen_editState createState() =>
      _name_password_screen_editState();
//  String profile_url;
//  String id_card_url;
//  String full_body_url;
//  name_password_screen_edit(this.profile_url,this.id_card_url,this.full_body_url);
}

class _name_password_screen_editState extends State<name_password_screen_edit> {
  @override
  TextEditingController progender = TextEditingController();
  TextEditingController proname = TextEditingController();
  TextEditingController propassword = TextEditingController();
//  TextEditingController prophno = TextEditingController();

  String? pro_name;
  String? pro_gender;
  String? pro_passsword;
  bool password_view = false;
//  String pro_phno;

  var gender_list = [
    'Male',
    'Female',
  ];

//  setState(() => controller.text = _fName);

  void initState() {
    super.initState();
    data_function();
  }

  var id = "";

  List data = [];
  data_function() async {
    data = await read_data_of_list();
    if (data != null) {
      id = data[0];
      proname.text = data[1];
      propassword.text = data[2];
      pro_gender = data[3];
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple,
      body: Stack(
        children: [
          Positioned(
            top: 150,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: light_pink,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
//                  topRight: Radius.circular(20.0)
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
//                        borderSide: BorderSide(color:   AppColor.purple.purple, width: 1.0),
//                      ),
//                      errorText: "",
//                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12.0),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
//                        borderSide: new BorderSide(color:   AppColor.purple.purple),
                            ),
                          ),
                          hint: pro_gender == null
                              ? Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: AppColor.purple,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  pro_gender!,
                                  style: TextStyle(
                                      color: AppColor.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          iconEnabledColor: AppColor.purple,
                          iconDisabledColor: AppColor.purple,
                          iconSize: 30.0,
                          style: TextStyle(
                              color: AppColor.purple,
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
                                pro_gender = val;
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
//                          onChanged: (text) {
//                            setState(() {
//                              pro_name=name;
//                              pro_name= text;
//                            });
//                          },
                          controller: proname,
                          decoration: new InputDecoration(
                            suffixIcon: Icon(
                              Icons.person_outline,
                              color: AppColor.purple,
                              size: 25.0,
                            ),
                            hintText: "Cnic Name",
                            hintStyle: TextStyle(
                              color: AppColor.purple,
                              fontFamily: "poppins",
                            ),
                            fillColor: Colors.grey[400],
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color:   AppColor.purple.purple, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:   AppColor.purple.purple, width: 2.0),
//                              borderRadius: new BorderRadius.circular(10.0),
//                            ),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: new TextStyle(
                            color: AppColor.purple,
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
                          obscureText: password_view == false ? false : true,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                          ],
                          onChanged: (text) {
                            setState(() {
                              pro_passsword = text;
                            });
                          },
                          controller: propassword,
                          decoration: new InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  password_view == false ? true : false;
                                });
                              },
                              child: Icon(
                                password_view == false
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColor.purple,
                                size: 25.0,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: AppColor.purple,
                              fontFamily: "poppins",
                            ),
                            fillColor: Colors.grey[400],
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color:   AppColor.purple.purple, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:   AppColor.purple.purple, width: 2.0),
//                              borderRadius: new BorderRadius.circular(10.0),
//                            ),
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
                        if (propassword.text.isNotEmpty &&
                            proname.text.isNotEmpty &&
                            pro_gender != null) {
                          var collection = FirebaseFirestore.instance
                              .collection(pro_gender!);
                          collection
                              .doc(
                                  id) // <-- Doc ID where data should be updated.
                              .update({
                            'name': proname.text,
                            'password': propassword.text,
                            'gender': pro_gender
                          }).then((_) {
                            add_data_to_List(id, proname.text, propassword.text,
                                pro_gender!);

                            update_Message();

                            print("updating");

                            Get.offAll(mainpage());
                            Get.to(matrimonial_mainpage());
                            Get.to(yourprofile());
                            Get.to(edit_main());
                          }).catchError((error) {
                            not_update_Message();
                          });

//                          Navigator.push(context, MaterialPageRoute(builder: (context) => personal_info(widget.profile_url, widget.id_card_url, widget.full_body_url, pro_gender, proname.text, propassword.text),));
                        } else {
                          fill_Message();
                        }
                      },
                      child: Container(
                        height: 45,
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
          Positioned(
            top: 0.0,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 30.0,
                                    color: AppColor.purple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Credentials",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
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
                        "Update Credential",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
