import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/UI/notificaition.dart';
import 'package:metrimonialsullokupdated/common_widget.dart';
import 'package:textfield_search/textfield_search.dart';

import '../../Global/constant.dart';
import '../../Global/value.dart';
import '../../upload.dart';

class admin_add_lookingfor extends StatefulWidget {
  @override
  String profile_image;
  String id_card_image;
  String full_body_image;
  var pro_name;
  var pro_password;
  var pro_gender;
  var pro_sect;
  var pro_caste;
  var pro_birth;
  var pro_education;
  var pro_familymember = "";
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

  admin_add_lookingfor(
      this.profile_image,
      this.id_card_image,
      this.full_body_image,
      this.pro_gender,
      this.pro_name,
      this.pro_password,
      this.pro_sect,
      this.pro_caste,
      this.pro_birth,
      this.pro_education,
      this.pro_familymember,
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
      : super(key: key); //ad
  _admin_add_lookingforState createState() => _admin_add_lookingforState();
}

class _admin_add_lookingforState extends State<admin_add_lookingfor> {
  @override
  TextEditingController lookcaste = TextEditingController();
  TextEditingController lookagestart = TextEditingController();
  TextEditingController lookageend = TextEditingController();
  TextEditingController lookeducation = TextEditingController();
  TextEditingController lookcity = TextEditingController();
  TextEditingController lookreligion = TextEditingController();
  TextEditingController looksalary = TextEditingController();
  TextEditingController lookprofession = TextEditingController();
  TextEditingController lookdesc = TextEditingController();
  String? look_caste;
  String? look_age_start;
  String? look_age_end;
  String? look_education;
  String? look_sect;
  String? look_salary = 'no salary';
  String? look_profession = "Non Working";
  String? look_height;
  String? look_martialstatus;
  String? look_city;
  String? look_country;
  String? look_explain = "NO explanation";
  String? employed_radio;
  bool employed_flag = false;

  static const caste_label = "Looking For Caste";
  static const education_label = "Looking For Education";
  static const profession_label = "Looking For Profession";

//  Stream<List<Caste>> getcaste(){
//    FirebaseFirestore.instance.collection('Caste').snapshots().map((event) => event.docs.map((e) => Caste.fromJson(e.data())
//    )).toList();
//
//  }

  bool casteshow = false;
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
//    Stream<List<Caste>> getcaste()=>FirebaseFirestore.instance.collection('Caste').
//    snapshots().map((event) => event.docs.map((e) => Caste.fromJson(e.data())
//    ).toList());
//
//    Stream<List<Education>> geteducation()=>FirebaseFirestore.instance.collection('Education').
//    snapshots().map((event) => event.docs.map((e) => Education.fromJson(e.data())
//    ).toList());
//
//
//    Stream<List<Profession>> getprofession()=>FirebaseFirestore.instance.collection('Profession').
//    snapshots().map((event) => event.docs.map((e) => Profession.fromJson(e.data())
//    ).toList());

    return BaseScaffold(
      child: Stack(
        children: [
          Positioned(
            top: 150.0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColor.pink,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child: Column(children: [
                      SizedBox(
                        height: 20.0,
                      ),

                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextFieldSearch(
                          initialList: caste_list,
                          label: caste_label,
                          controller: lookcaste,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 12.0),
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
//                                focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            labelText: "Looking For Caste",
                            suffixIcon: Icon(
                              Icons.search,
                              color: AppColor.purple,
                            ),
                            labelStyle: TextStyle(
                                color: AppColor.purple,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Looking For Age From",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.purple,
                              fontSize: 20.0,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Material(
                                elevation: 10.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: TextFormField(
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        look_age_start = text;
                                      });
                                    },
                                    controller: lookagestart,
                                    validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return "Plz Enter  age";
                                      }
                                    },
                                    decoration: new InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(12),
                                      labelText: "Age",
                                      labelStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                      fillColor: Colors.white,
                                      errorStyle: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16.0),
                                      prefixIcon: Icon(
                                        Icons.calendar_today_sharp,
                                        color: AppColor.purple,
                                      ),
//                                      enabledBorder: OutlineInputBorder(
//                                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                      ),
//                                      focusedBorder: OutlineInputBorder(
//                                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                      ),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  "To",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.purple,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Material(
                                elevation: 10.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: TextFormField(
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        look_age_end = text;
                                      });
                                    },
                                    controller: lookageend,
                                    validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return "Plz Enter  age";
                                      }
                                    },
                                    decoration: new InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(12),
                                      labelText: "Age",
                                      labelStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                      fillColor: Colors.white,
                                      errorStyle: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16.0),
                                      prefixIcon: Icon(
                                        Icons.calendar_today_sharp,
                                        color: AppColor.purple,
                                      ),
//                                      enabledBorder: OutlineInputBorder(
//                                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                      ),
//                                      focusedBorder: OutlineInputBorder(
//                                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                      ),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      //look_education
//                          StreamBuilder<List<Education>>(
//                            stream: geteducation(),
//                            builder: (context, snapshot) {
//                              if (snapshot.hasData) {
//                                return Container(
//                                  height:58,
//                                  child: DropdownButtonFormField(
//                                    validator: (value) {
//                                      if (value == '' || value == null) {
//                                        return "Plz Enter education";
//                                      }
//                                    },
//                                    decoration: InputDecoration(
//                                      enabledBorder: OutlineInputBorder(
//                                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                      ),
////                      errorText: "",
//                                      errorStyle:
//                                      TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                                      border: new OutlineInputBorder(
//                                        borderRadius: new BorderRadius.circular(10.0),
//                                        borderSide: new BorderSide(color:  AppColor.purple),
//                                      ),
//                                    ),
//                                    hint: look_education == null
//                                        ? Text(
//                                      'Candidate Education',
//                                       style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                                    )
//                                        : Text(
//                                      look_education,
//                                       style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                                    ),
//                                    isExpanded: true,
//                                    icon: Icon(Icons.arrow_drop_down_circle_outlined,),
//
//                                    iconEnabledColor:  AppColor.purple,
//                                    iconDisabledColor:  AppColor.purple,
//                                    iconSize: 30.0,
//                                     style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                                    items: snapshot.data.map(
//                                          (val) {
//                                        return DropdownMenuItem<String>(
//                                          value: val.education,
//                                          child: Text(val.education),
//                                        );
//                                      },
//                                    ).toList(),
//                                    onChanged: (val) {
//                                      setState(
//                                            () {
////                                          if (val == "other") {
////                                            educationshow = true;
////                                          } else {
//                                            look_education = val;
////                                            educationshow=false;
////                              educationshow==true?educationshow=false:educationshow=true;
////                                          }
//                                        },
//                                      );
//                                    },
//                                  ),
//                                );
//                              } else {
//                                return CircularProgressIndicator();
//                              }
//                            },
//                          ),

                      SizedBox(
                        height: 20.0,
                      ),

                      //look_education others
//              Visibility(
//                visible: educationshow,
//                child: TextFormField(
//                  onChanged: (text) {
//                    setState(() {
//                      look_education = text;
//                    });
//                  },
//                  controller: lookeducation,
//                  validator: (value) {
//                    if (value.isEmpty || value == null) {
//                      return "Plz Enter  education";
//                    }
//                  },
//                  decoration: new InputDecoration(
//                    helperText: "Plz enter you education if not find it above",
//                    hintText: "Education",
//                    hintStyle: TextStyle(
//                      color:  AppColor.purple,
//                      fontFamily: "poppins",
//                    ),
//                    fillColor: Colors.white,
//                    errorStyle:
//                        TextStyle(color: Colors.redAccent, fontSize: 16.0),
//                    enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                    ),
//                    focusedBorder: OutlineInputBorder(
//                      borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                    ),
//                    border: new OutlineInputBorder(
//                      borderRadius: new BorderRadius.circular(10.0),
//                    ),
//                  ),
//                ),
//              ),

                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextFieldSearch(
                          initialList: education_list,
                          label: education_label,
                          controller: lookeducation,
                          decoration: new InputDecoration(
                            fillColor: Colors.white,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 12.0),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            labelText: "Looking For Education",
                            suffixIcon: Icon(
                              Icons.search,
                              color: AppColor.purple,
                            ),
                            labelStyle: TextStyle(
                                color: AppColor.purple,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

//              Visibility(
//                visible: educationshow,
//                child: SizedBox(
//                  height: 20.0,
//                ),
//              ),

                      SizedBox(
                        height: 20.0,
                      ),

                      //religion
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == '' || value == null) {
                                return "Plz Enter Sect";
                              }
                            },
                            decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                      errorText: "",
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 16.0),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                                //   borderSide: new BorderSide(color:  AppColor.purple),
                              ),
                            ),
                            hint: look_sect == null
                                ? Text(
                                    'Sect',
                                    style: TextStyle(
                                        color: AppColor.purple,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    look_sect!,
                                    style: TextStyle(
                                        color: AppColor.purple,
                                        fontWeight: FontWeight.bold),
                                  ),
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                            ),
                            iconEnabledColor: AppColor.purple,
                            iconDisabledColor: AppColor.purple,
                            iconSize: 30.0,
                            style: TextStyle(
                                color: AppColor.purple,
                                fontWeight: FontWeight.bold),
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
                                  look_sect = val;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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
                                return "Plz Enter height";
                              }
                            },
                            decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 12.0),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                              ),
                            ),
                            hint: look_height == null
                                ? Text(
                                    'Candidate Height',
                                    style: TextStyle(
                                        color: AppColor.purple,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    look_height!,
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
                            items: height_list.map(
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
                                  look_height = val;
                                },
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      //martial status
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == '' || value == null) {
                                return "Plz Enter martial status";
                              }
                            },
                            decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                      errorText: "",
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 16.0),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
//                                borderSide: new BorderSide(color:  AppColor.purple),
                              ),
                            ),
                            hint: look_martialstatus == null
                                ? Text(
                                    'Martialstatus',
                                    style: TextStyle(
                                        color: AppColor.purple,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    look_martialstatus!,
                                    style: TextStyle(
                                        color: AppColor.purple,
                                        fontWeight: FontWeight.bold),
                                  ),
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                            ),
                            iconEnabledColor: AppColor.purple,
                            iconDisabledColor: AppColor.purple,
                            iconSize: 30.0,
                            style: TextStyle(
                                color: AppColor.purple,
                                fontWeight: FontWeight.bold),
                            items: martialstatus_list.map(
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
                                  look_martialstatus = val;
                                },
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30.0,
                      ),

                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Employement Status",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.purple,
                              fontSize: 20.0,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              height: 40,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Working",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColor.purple,
                                    fontSize: 15.0,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Theme(
                              data: ThemeData(
                                //here change to your color
                                unselectedWidgetColor: AppColor.purple,
                              ),
                              child: Radio(
//             title: Text("Employed",
//               style: TextStyle(
//                 color:  AppColor.purple,
//               ),),
                                value: "Working",

                                activeColor: AppColor.purple,
                                groupValue: employed_radio,

                                onChanged: (value) {
                                  setState(() {
                                    employed_flag = true;
                                    employed_radio = value.toString();
                                    lookprofession.clear();
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              height: 40,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Non Working",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColor.purple,
                                    fontSize: 15.0,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Theme(
                              data: ThemeData(
                                //here change to your color
                                unselectedWidgetColor: AppColor.purple,
                              ),
                              child: Radio(
                                activeColor: AppColor.purple,

//             title: Text("Unemployed",  style: TextStyle(
//               color:  AppColor.purple,
//             ),),
                                value: "Non Working",
                                groupValue: employed_radio,
                                onChanged: (value) {
                                  setState(() {
                                    employed_radio = value.toString();
                                    employed_flag = false;
                                    lookprofession.text = value.toString();
                                    looksalary.text = "No Salary";
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Visibility(
                        visible: employed_flag,
                        child: SizedBox(
                          height: 20.0,
                        ),
                      ),

                      Visibility(
                        visible: employed_flag,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 10.0,
                          child: TextFieldSearch(
                            initialList: profession_list,
                            label: profession_label,
                            controller: lookprofession,
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 12.0),
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
//                                focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: " Looking For Profession",
                              suffixIcon: Icon(
                                Icons.search,
                                color: AppColor.purple,
                              ),
                              labelStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: employed_flag,
                        child: SizedBox(
                          height: 20.0,
                        ),
                      ),

//                      Material(
//                        elevation: 10.0,
//                        borderRadius: BorderRadius.circular(20.0),
//                        child: Container(
//                          height: 58,
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(20.0),
//                          ),
//                          child: TextFormField(
//                            onChanged: (text) {
//                              setState(() {
//                                look_profession = text;
//                              });
//                            },
//                            controller: lookprofession,
//                            validator: (value) {
//                              if (value.isEmpty || value == null) {
//                                return "Plz Enter your Profession";
//                              }
//                            },
//                            decoration: new InputDecoration(
//                              helperText: "Plz enter you Job if not find it above",
//                              hintText: "Profession",
//                              hintStyle: TextStyle(
//                                color:  AppColor.purple,
//                                fontFamily: "poppins",
//                              ),
//                              fillColor: Colors.white,
//                              errorStyle:
//                                  TextStyle(color: Colors.redAccent, fontSize: 16.0),
////                          enabledBorder: OutlineInputBorder(
////                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
////                          ),
////                          focusedBorder: OutlineInputBorder(
////                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
////                          ),
//                              border: new OutlineInputBorder(
//                                borderRadius: new BorderRadius.circular(20.0),
//                                borderSide: BorderSide.none,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),

                      //salary
                      Visibility(
                        visible: employed_flag,
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 58.0,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                setState(() {
                                  look_salary = text;
                                });
                              },
                              controller: looksalary,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter monthly income";
                                }
                              },
                              decoration: new InputDecoration(
                                hintText: " Monthly Income",
                                labelText: " Monthly Income",
                                labelStyle: TextStyle(
                                    color: AppColor.purple,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(
                                    fontFamily: "poppins",
                                    color: AppColor.purple,
                                    fontSize: 14.0),
                                fillColor: Colors.white,
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
////                      errorText: "",
//                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                              borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Location",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.purple,
                              fontSize: 20.0,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      CSCPicker(
                        showStates: true,
                        showCities: true,
                        layout: Layout.vertical,
                        // style: TextStyle(
                        //   color: AppColor.purple,
                        //   fontFamily: "poppins",
                        // ),
                        onCountryChanged: (value) {
                          setState(() {
                            look_country = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            var stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            look_city = value;
                          });
                        },
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Additional info",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.purple,
                              fontSize: 20.0,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 58,
                          child: TextField(
                            onChanged: (text) {
                              setState(() {
                                look_explain = text;
                              });
                            },
                            controller: lookdesc,
//                                validator: (value) {
//                                  if (value.isEmpty || value == null) {
//                                    return "Plz Enter Any thing you want to Explain";
//                                  }
//                                },
//                                autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: new InputDecoration(
                              hintText: "Any thing you want to Explain",
                              labelText: "Any thing you want to Explain",
                              labelStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.bold),

                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.purple,
                                fontFamily: "poppins",
                              ),
                              fillColor: Colors.white,
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 12.0),
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
//                                focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
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
                        height: 20.0,
                      ),

                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            processing_Message();

                            if (widget.pro_gender == "Male") {
                              Upload.admin_add_male(
                                widget.profile_image,
                                widget.id_card_image,
                                widget.full_body_image,
                                widget.pro_gender,
                                widget.pro_name,
                                widget.pro_password,
                                widget.pro_sect,
                                widget.pro_caste,
                                widget.pro_birth,
                                widget.pro_education,
                                widget.pro_familymember,
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
                                lookcaste.text,
                                look_age_start!,
                                look_age_end!,
                                lookeducation.text,
                                look_sect!,
                                lookprofession.text,
                                look_salary!,
                                look_height!,
                                look_martialstatus!,
                                look_country!,
                                look_city!,
                                look_explain!,
                              ).then((value) {});
                            } else if (widget.pro_gender == "Female") {
                              Upload.admin_add_female(
                                widget.profile_image,
                                widget.id_card_image,
                                widget.full_body_image,
                                widget.pro_gender,
                                widget.pro_name,
                                widget.pro_password,
                                widget.pro_sect,
                                widget.pro_caste,
                                widget.pro_birth,
                                widget.pro_education,
                                widget.pro_familymember,
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
                                lookcaste.text,
                                look_age_start!,
                                look_age_end!,
                                lookeducation.text,
                                look_sect!,
                                lookprofession.text,
                                look_salary!,
                                look_height!,
                                look_martialstatus!,
                                look_country!,
                                look_city!,
                                look_explain!,
                              ).then((value) {});
                            }
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
                                  light_pink,
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                'Done'.toUpperCase(),
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
                                  child: const Icon(
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

                      SizedBox(
                        height: 300.0,
                      ),
                    ])),
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
                  SizedBox(height: 20.0),

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

                  //name
                  SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add Looking For Info",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
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
////height
//DropdownButtonFormField(
//validator: (value) {
//if (value == '' || value == null) {
//return "Plz Enter  height";
//}
//},
//decoration: InputDecoration(
//enabledBorder: OutlineInputBorder(
//borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//),
////                      errorText: "",
//errorStyle:
//TextStyle(color: Colors.redAccent, fontSize: 16.0),
//border: new OutlineInputBorder(
//borderRadius: new BorderRadius.circular(10.0),
//borderSide: new BorderSide(color:  AppColor.purple),
//),
//),
//hint: look_height == null
//? Text(
//'Height',
// style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//)
//: Text(
//look_height,
// style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//),
//isExpanded: true,
//iconEnabledColor:  AppColor.purple,
//iconDisabledColor:  AppColor.purple,
//iconSize: 30.0,
// style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//items: height_list.map(
//(val) {
//return DropdownMenuItem<String>(
//value: val,
//child: Text(val),
//);
//},
//).toList(),
//onChanged: (val) {
//setState(
//() {
//look_height = val;
//},
//);
//},
//),
//
//SizedBox(
//height: 20.0,
//),

//caste
//                  StreamBuilder<List<Caste>>(
//                    stream: getcaste(),
//                    builder: (context, snapshot) {
//                      if (snapshot.hasData) {
//                        return DropdownButtonFormField(
//                          validator: (value) {
//                            if (value == '' || value == null) {
//                              return "Plz Enter caste";
//                            }
//                          },
//                          decoration: InputDecoration(
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
//                            errorStyle:
//                            TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                            border: new OutlineInputBorder(
//                              borderRadius: new BorderRadius.circular(10.0),
//                              borderSide: new BorderSide(color:  AppColor.purple),
//                            ),
//                          ),
//
//                          hint: look_caste == null
//                              ? Text(
//                            'caste',
//                             style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                          )
//                              : Text(
//                            look_caste,
//                             style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                          ),
//                                      isExpanded: true,
//                          icon: Icon(Icons.arrow_drop_down_circle_outlined, ),
//                          iconEnabledColor:  AppColor.purple,
//                          iconDisabledColor:  AppColor.purple,
//                          iconSize: 30.0,
//                           style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                          items: snapshot.data.map(
//                                (val) {
//                              print("heelo");
//                              return DropdownMenuItem<String>(
//
//                                child: Text(val.caste),
//                                value: val.caste,
//                              );
//
//                            },
//                          ).toList(),
//
//                          onChanged: (val) {
//                            setState(
//                                  () {
//                                if (val == "other") {
//                                  casteshow = true;
//                                } else {
//                                  look_caste = val;
//                                  casteshow = false;
//                                }
//                                print(look_caste);
//                              },
//                            );
//                          },
//                        );
//                      } else {
//                        return Center(child: CircularProgressIndicator());
//                      }
//                    },

//Visibility(
//                        visible: casteshow,
//                        child: TextFormField(
//                          onChanged: (text) {
//                            setState(() {
//                              look_caste = text;
//                            });
//                          },
//                          controller: lookcaste,
//                          validator: (value) {
//                            if (value.isEmpty || value == null) {
//                              return "Plz Enter caste";
//                            }
//                          },
//                          decoration: new InputDecoration(
//                            helperText: "Plz enter your caste if not find it above",
//                            hintText: "caste",
//                            hintStyle: TextStyle(
//                              color:  AppColor.purple,
//                              fontFamily: "poppins",
//                            ),
//                            fillColor: Colors.white,
//                            errorStyle:
//                                TextStyle(color: Colors.redAccent, fontSize: 16.0),
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
//                            border: new OutlineInputBorder(
//                              borderRadius: new BorderRadius.circular(10.0),
//                            ),
//                          ),
//                        ),
//                      ),
//
//                      Visibility(
//                        visible: casteshow,
//                        child: SizedBox(
//                          height: 20.0,
//                        ),
//                      ),

//job
//                  Visibility(
//                    visible: employed_flag,
//                    child: StreamBuilder<List<Profession>>(
//                      stream: getprofession(),
//                      builder: (context, snapshot) {
//                        if (snapshot.hasData) {
//                          return Container(
//                            height:58,
//                            child: DropdownButtonFormField(
//                              validator: (value) {
//                                if (value == '' || value == null) {
//                                  return "Plz Enter job";
//                                }
//                              },
//                              decoration: InputDecoration(
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
////                      errorText: "",
//                                errorStyle:
//                                TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                                border: new OutlineInputBorder(
//                                  borderRadius: new BorderRadius.circular(10.0),
//                                  borderSide: new BorderSide(color:  AppColor.purple),
//                                ),
//                              ),
//                              hint: look_profession == null
//                                  ? Text(
//                                'Profession',
//                                 style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                              )
//                                  : Text(
//                                look_profession,
//                                 style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                              ),
//                              isExpanded: true,
//                              icon: Icon(Icons.arrow_drop_down_circle_outlined,),
//                              iconEnabledColor:  AppColor.purple,
//                              iconDisabledColor:  AppColor.purple,
//                              iconSize: 30.0,
//                               style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                              items: snapshot.data.map(
//                                    (val) {
//                                  return DropdownMenuItem<String>(
//                                    value: val.profession,
//                                    child: Text(val.profession),
//                                  );
//                                },
//                              ).toList(),
//                              onChanged: (val) {
//                                setState(
//                                      () {
//                                    if (val == "other") {
//                                      jobshow = true;
//                                    } else {
//                                      look_profession = val;
//                                      jobshow=false;
//                                    }
//                                  },
//                                );
//                              },
//                            ),
//                          );
//                        } else {
//                          return CircularProgressIndicator();
//                        }
//                      },
//                    ),
//                  ),
