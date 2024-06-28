import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

import '../../Global/constant.dart';
import '../../Global/value.dart';
import '../notificaition.dart';
import 'looking_for.dart';

class family_profile extends StatefulWidget {
  @override
  String profile_image;
  String id_card_image;
  String full_body_image;
  var pro_name;
  var pro_password;
  var pro_gender;
  var pro_birth;
  var pro_education;
  var pro_profession;
  var pro_salary;
  var pro_height;
  var pro_weight;
  var pro_complexion;
  var pro_lifestandard;
  var pro_martialstatus;
  var pro_country = "";
  var pro_city = "";
  var pro_address;
  var pro_phno;
  var pro_explain;

  family_profile(
      this.profile_image,
      this.id_card_image,
      this.full_body_image,
      this.pro_gender,
      this.pro_name,
      this.pro_password,
      this.pro_birth,
      this.pro_education,
      this.pro_profession,
      this.pro_salary,
      this.pro_height,
      this.pro_weight,
      this.pro_complexion,
      this.pro_lifestandard,
      this.pro_martialstatus,
      this.pro_country,
      this.pro_city,
      this.pro_address,
      this.pro_phno,
      this.pro_explain,
      {Key? key})
      : super(key: key);
  _family_profileState createState() => _family_profileState();
}

class _family_profileState extends State<family_profile> {
  @override
  TextEditingController procaste = TextEditingController();
  TextEditingController profamilymember = TextEditingController();

  static const caste_label = "Caste";

  String? pro_sect;
  String? pro_caste;
  String? pro_familymember = "";
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        "Family Profile",
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
                reverse: true,
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColor.pink,
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
                          child: TextFieldSearch(
                            minStringLength: 10,
                            initialList: caste_list,
                            label: caste_label,
                            controller: procaste,
                            decoration: new InputDecoration(
                              fillColor: appcolor,
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
                              labelText: " Candidate Caste",
                              suffixIcon: Icon(
                                Icons.search,
                                color: appcolor,
                              ),
                              labelStyle: TextStyle(
                                  color: appcolor,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30.0,
                        ),

                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 58,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Plz Enter Sect";
                                }
                              },
                              decoration: InputDecoration(
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: appcolor, width: 1.0),
//                        ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              hint: pro_sect == null
                                  ? Text(
                                      'Candidate Sect',
                                      style: TextStyle(
                                          color: appcolor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      pro_sect!,
                                      style: TextStyle(
                                          color: appcolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                              isExpanded: true, //heello
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconEnabledColor: appcolor,
                              iconDisabledColor: appcolor,
                              iconSize: 30.0,
                              style: TextStyle(
                                  color: appcolor, fontWeight: FontWeight.bold),

                              items: sect_List.map(
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
                                    pro_sect = val;
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30.0,
                        ),

                        //Family member
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
                                  pro_familymember = text;
                                });
                              },
                              controller: profamilymember,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter Family Member";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: new InputDecoration(
                                hintText: "Candidate Total Family members",
                                labelStyle: TextStyle(
                                    color: appcolor,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),

                                labelText: "Candidate Total Family members",
                                hintStyle: TextStyle(
                                  color: appcolor,
                                  fontFamily: "poppins",
                                ),
                                fillColor: Colors.white,
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: appcolor, width: 1.0),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: appcolor, width: 1.0),
//                              ),
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

                        GestureDetector(
                          onTap: () async {
                            if (profamilymember.text.isNotEmpty &&
                                procaste.text.isNotEmpty &&
                                pro_sect != null) {
                              processing_Message();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => lookingfor(
                                      widget.profile_image,
                                      widget.id_card_image,
                                      widget.full_body_image,
                                      widget.pro_gender,
                                      widget.pro_name,
                                      widget.pro_password,
                                      pro_sect,
                                      procaste.text,
                                      widget.pro_birth,
                                      widget.pro_education,
                                      profamilymember.text,
                                      widget.pro_profession,
                                      widget.pro_salary,
                                      widget.pro_height,
                                      widget.pro_weight,
                                      widget.pro_complexion,
                                      widget.pro_lifestandard,
                                      widget.pro_martialstatus,
                                      widget.pro_country,
                                      widget.pro_city,
                                      widget.pro_address,
                                      widget.pro_phno,
                                      widget.pro_explain,
                                    ),
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
