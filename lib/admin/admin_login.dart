import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/common_widget.dart';

import '../Global/constant.dart';
import '../UI/notificaition.dart';
import 'admin_main.dart';

class admin_login extends StatefulWidget {
  @override
  _admin_loginState createState() => _admin_loginState();
}

class _admin_loginState extends State<admin_login> {
  @override
  TextEditingController name_txt = TextEditingController();
  TextEditingController password_txt = TextEditingController();
  String? name;
  String? password;
  bool password_view = false;

  Widget build(BuildContext context) {
    return BaseScaffold(
      child: SingleChildScrollView(
        child: Container(
//          height: MediaQuery.of(context).size.height,
//          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                back_button(context),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Hi,Admin",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: appcolor,
                        fontSize: 20.0,
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
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {
                          name = text;
                        });
                      },
                      controller: name_txt,
                      decoration: new InputDecoration(
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: appcolor,
                          size: 25.0,
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: appcolor,
                          fontFamily: "poppins",
                        ),
                        fillColor: Colors.grey[400],
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appcolor, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appcolor, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide.none),
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
                Material(
                  elevation: 10.0,
                  borderRadius: new BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
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
                            color: AppColor.cancelColor,
                            size: 25.0,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: appcolor,
                          fontFamily: "poppins",
                        ),
                        fillColor: Colors.grey[400],
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appcolor, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appcolor, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide.none),
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
                  onTap: () {
                    if (name_txt.text.isNotEmpty &&
                        password_txt.text.isNotEmpty) {
//                       print('in');
                      if (name == "sulook" && password == "khawar") {
//                          print('innrer');
                        Welcome_Message();
//                        Get.to(admin_main());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => admin_main(),
                            ));

                        name_txt.clear();
                        password_txt.clear();
                      } else {}
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
