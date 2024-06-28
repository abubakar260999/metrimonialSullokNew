import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/UI/add_forms/personal_info.dart';

import '../../Global/constant.dart';
import '../notificaition.dart';

class contact_password_screen extends StatefulWidget {
  @override
  _contact_password_screenState createState() =>
      _contact_password_screenState();
  String profile_url;
  String id_card_url;
  String full_body_url;
  contact_password_screen(
      this.profile_url, this.id_card_url, this.full_body_url);
}

class _contact_password_screenState extends State<contact_password_screen> {
  @override
  TextEditingController prophno = TextEditingController();
  TextEditingController propassword = TextEditingController();
  String? pro_phno;
  String? pro_passsword;
  bool password_view = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor,
      body: Stack(
        children: [
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
                                    color: appcolor,
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
                        "Candidate Profile",
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
                        "Remember these credential for loging again",
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
          Positioned(
            top: 150,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
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
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                setState(() {
                                  pro_phno = text;
                                });
                              },
                              controller: prophno,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter Contact no";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: new InputDecoration(
                                hintText: "Contact no",
                                labelText: "Contact no",
                                labelStyle: TextStyle(
                                    color: appcolor,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(
                                  color: appcolor,
                                  fontFamily: "poppins",
                                ),
                                fillColor: Colors.white,
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color: appcolor, width: 1.0),
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color: appcolor, width: 1.0),
//                          ),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
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
                              obscureText:
                                  password_view == false ? true : false,
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
                                    // color: red,
                                    size: 25.0,
                                  ),
                                ),
                                hintText: "Password",
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
                                prophno.text != null) {
                              processing_Message();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => personal_info(
                                        widget.profile_url,
                                        widget.id_card_url,
                                        widget.full_body_url,
                                        prophno.text,
                                        propassword.text),
                                  ));
                              //      Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: personal_info(widget.profile_url, widget.id_card_url, widget.full_body_url, pro_gender, proname.text, propassword.text)));
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
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
            ),
          ),
        ],
      ),
    );
  }
}
