import 'package:flutter/material.dart';

import '../../Global/constant.dart';
import '../notificaition.dart';
import 'admin_add_personal_info.dart';

class admin_add_name_password_screen extends StatefulWidget {
  @override
  _admin_add_name_password_screenState createState() =>
      _admin_add_name_password_screenState();
  String profile_url;
  String id_card_url;
  String full_body_url;
  admin_add_name_password_screen(
      this.profile_url, this.id_card_url, this.full_body_url);
}

class _admin_add_name_password_screenState
    extends State<admin_add_name_password_screen> {
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple,
      body: Stack(
        children: [
          Positioned(
            top: 150,
            child: SingleChildScrollView(
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
//                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                      ),
//                      errorText: "",
//                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12.0),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
//                        borderSide: new BorderSide(color:  AppColor.purple),
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
                            onChanged: (text) {
                              setState(() {
                                pro_name = text;
                              });
                            },
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
//                        borderSide: BorderSide(color:  AppColor.purple, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 2.0),
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
                            obscureText: password_view == false ? true : false,
                            onChanged: (text) {
                              setState(() {
                                pro_passsword = text;
                              });
                            },
                            controller: propassword,
                            decoration: InputDecoration(
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
                                color: AppColor.cancelColor,
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
                              proname.text.isNotEmpty &&
                              pro_gender != null) {
                            processing_Message();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => admin_add_personal_info(
                                      widget.profile_url,
                                      widget.id_card_url,
                                      widget.full_body_url,
                                      pro_gender!,
                                      proname.text,
                                      propassword.text),
                                ));
                            //  Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: admin_add_personal_info(widget.profile_url, widget.id_card_url, widget.full_body_url, pro_gender, proname.text, propassword.text)));
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
                        "Add Candidate Credentials",
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
        ],
      ),
    );
  }
}
